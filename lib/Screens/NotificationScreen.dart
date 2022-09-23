import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/BottomBar.dart';
import 'package:bibliotheca/Components/NotificationCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashBoardScreen.dart';
import 'package:bibliotheca/constants.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = '/notif';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  var dt =  DateTime.now();
  String? admno = "";
  bool exist = false;
  late QueryDocumentSnapshot<Map<String, dynamic>> books;
  List<String> bookids = [];
  List<String> booknames = [];
  List issuedates = [];
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    admno = prefs.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, DashBoardScreen.id);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Montserrat',
                            shadows: [
                              BoxShadow(
                                color: Color(0x7fffffff),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Container(
                          height: 632,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Students')
                                .snapshots(),
                            builder: (context, snapshots) {
                              return (snapshots.connectionState ==
                                  ConnectionState.waiting)
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColour,
                                ),
                              )
                                  : ListView.builder(
                                  itemCount: snapshots.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var data = snapshots.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                    if (data['admno'] == admno &&
                                        data['bookid'] != null) {
                                      List l1 = data['bookid'];
                                      List l2 = data['bookname'];
                                      List l3 = data['issuedates'];
                                      List l4 = data['returndates'];
                                      exist = true;

                                      return Container(
                                        height: 600,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            itemCount: l1.length,
                                            itemBuilder: (context, index) {
                                              DateTime date_issue =
                                              l3[index].toDate();
                                              String issuedate =
                                                  "${date_issue.day}-${date_issue.month}-${date_issue.year}";
                                              // DateTime date_return = date_issue.add(Duration(days: 15));
                                              DateTime date_return =
                                              l4[index].toDate();
                                              String returndate =
                                                  "${date_return.day}-${date_return.month}-${date_return.year}";

                                              var days = date_return.difference(dt);
                                              return NotificationsCard(name: l2[index], date: returndate, days: days.inDays>0?days.inDays.toString():"0");
                                            }),
                                      );
                                    } else if (index ==
                                        snapshots.data!.docs.length - 1 &&
                                        exist == false) {
                                      return Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "No isssued books!",
                                              style: dashboardTextStyle.copyWith(
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  });
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          index: 2,
        ),
      ),
    );
  }
}
