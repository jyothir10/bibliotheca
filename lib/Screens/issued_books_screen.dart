import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/ib_card.dart';

class IssuedBooks extends StatefulWidget {
  static const String id = '/ib';
  const IssuedBooks({Key? key}) : super(key: key);

  @override
  State<IssuedBooks> createState() => _IssuedBooksState();
}

class _IssuedBooksState extends State<IssuedBooks> {
  String? admno = "";
  bool exist = false;
  late QueryDocumentSnapshot<Map<String, dynamic>> books;
  List<String> bookids = [];
  List<String> booknames = [];
  List issuedates = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    admno = prefs.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Background(),
        const Positioned(
          left: 65,
          top: 95,
          child: Text(
            'Issued Books',
            style: TextStyle(
              color: Color(0xFF0025A9),
              fontSize: 32,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Color(0xFF545AD8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.08 * MediaQuery.of(context).size.height,
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

                                          return ibCard(
                                              isbn: l1[index],
                                              bookName: l2[index],
                                              issueDate: issuedate,
                                              returnDate: returndate);
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
      ]),
    );
  }
}
