import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/ReissueBookCard.dart';
import 'package:bibliotheca/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReissueBookScreen extends StatefulWidget {
  static const String id = '/reissue';
  const ReissueBookScreen({Key? key}) : super(key: key);

  @override
  State<ReissueBookScreen> createState() => _ReissueBookScreenState();
}

class _ReissueBookScreenState extends State<ReissueBookScreen> {
  int i = 0;
  late DateTime date_new;
  String newdate = "";
  var dt = DateTime.now();
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

  updateReturndate() async {
    final student =
        FirebaseFirestore.instance.collection('Students').doc(admno);
    //  student.update({'returndates': });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: InkWell(
                          child: const Icon(Icons.arrow_back),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Text(
                          'Reissue Book',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 38,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      Container(
                        height: 640,
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
                                      if (data['admno'] == admno) {
                                        List l1 = data['bookid'];
                                        List l2 = data['bookname'];
                                        List l3 = data['issuedates'];
                                        List l4 = data['returndates'];

                                        final student = FirebaseFirestore
                                            .instance
                                            .collection('Students')
                                            .doc(admno);

                                        return Container(
                                          height: 600,
                                          width:
                                              MediaQuery.of(context).size.width,
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

                                                if (dt.isBefore(date_return)) {
                                                  return ReissueBookScreenCard(
                                                    isbn: l1[index],
                                                    bookname: l2[index],
                                                    issueDate: issuedate,
                                                    dueDate: i == 0
                                                        ? returndate
                                                        : newdate,
                                                    ontap: () {
                                                      date_new = date_return
                                                          .add(const Duration(
                                                              days: 20));
                                                      newdate =
                                                          "${date_new.day}-${date_new.month}-${date_new.year}";

                                                      l4[index] = date_new;

                                                      student.update({
                                                        "returndates"[index]:
                                                            FieldValue
                                                                .arrayUnion(l4)
                                                      });

                                                      setState(
                                                        () {
                                                          i++;
                                                        },
                                                      );
                                                    },
                                                  );
                                                } else
                                                  return Container();
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
