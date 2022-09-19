import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/BottomBar.dart';
import 'package:bibliotheca/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/ib_card.dart';
import 'DashBoardScreen.dart';

class HistoryScreen extends StatefulWidget {
  static const String id = '/history';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
        body: Stack(children: <Widget>[
          Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: Color(0xFF0025A9),
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Container(
                      height: 565,
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
                                    var data = snapshots.data!.docs[index]
                                        .data() as Map<String, dynamic>;
                                    if (data['admno'] == admno &&
                                        data[bookids] != null) {
                                      List l1 = data['bookid'];
                                      List l2 = data['bookname'];
                                      List l3 = data['issuedates'];
                                      List l4 = data['returndates'];

                                      exist = true;

                                      return Container(
                                        height: 565,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: ListView.builder(
                                              itemCount: l1.length,
                                              itemBuilder: (context, index) {
                                                DateTime date_issue =
                                                    l3[index].toDate();
                                                String issuedate =
                                                    "${date_issue.day}-${date_issue.month}-${date_issue.year}";
                                                DateTime date_return =
                                                    l4[index].toDate();
                                                String returndate =
                                                    "${date_return.day}-${date_return.month}-${date_return.year}";

                                                return ibCard(
                                                    isbn: l1[index],
                                                    bookName: l2[index],
                                                    issueDate: issuedate,
                                                    returnDate: returndate);
                                              }),
                                        ),
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
                                              style: dashboardTextStyle
                                                  .copyWith(fontSize: 14),
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
        ]),
        bottomNavigationBar: const BottomBar(
          index: 1,
        ),
      ),
    );
  }
}
