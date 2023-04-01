import 'dart:math' as math;

import 'package:bibliotheca/Components/FineCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/FineCard.dart';
import '../constants.dart';
import 'DashBoardScreen.dart';
//import 'package:intl/intl.dart';

class DuePaymentScreen extends StatefulWidget {
  static const String id = '/pay_due';
  const DuePaymentScreen({Key? key}) : super(key: key);

  @override
  DuePaymentScreenState createState() => DuePaymentScreenState();
}

class DuePaymentScreenState extends State<DuePaymentScreen> {
  final _razorpay = Razorpay();
  var dt = DateTime.now();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getUser();
  }

  var options = {
    'key': 'rzp_test_7oSEtWonPIbah3',
    'amount': 500, //in the smallest currency sub-unit.
    'name': 'Bibliotheca',
    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
    'description': 'Paying FIne',
    'timeout': 60, // in seconds
    'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
  };

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Done");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  String? admno = "";
  bool exist = false;
  late QueryDocumentSnapshot<Map<String, dynamic>> books;
  List<String> bookids = [];
  List<String> booknames = [];
  List issuedates = [];

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    admno = prefs.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    //final now = new DateTime.now();
    // try {
    //   _razorpay.open(options);
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Positioned(
          top: 530,
          left: -108,
          child: Container(
            width: 215,
            height: 224,
            decoration: BoxDecoration(
              color: const Color(0xFF545AD8).withOpacity(0.24),
              borderRadius: const BorderRadius.all(Radius.elliptical(215, 224)),
            ),
          ),
        ),
        Positioned(
            top: -5,
            left: 220,
            //342.33056640625
            child: Transform.rotate(
              angle: 40 * (math.pi / 180),
              child: Container(
                  width: 267,
                  height: 121,
                  decoration: BoxDecoration(
                    color: const Color(0xFF445FBF).withOpacity(0.56),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(267, 121)),
                  )),
            )),
        Positioned(
            top: -5,
            left: 220,
            child: Transform.rotate(
              angle: 130 * (math.pi / 180),
              child: Container(
                  width: 413,
                  height: 181,
                  decoration: BoxDecoration(
                    color: const Color(0xFF545AD8).withOpacity(0.70),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(413, 181)),
                  )),
            )),
        const Positioned(
          left: 65,
          top: 85,
          child: Text(
            'Pay Fine',
            style: TextStyle(
              color: Color(0xFF0025A9),
              fontSize: 32,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, left: 10),
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
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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

                                        if (dt.isAfter(date_return)) {
                                          var day = dt.difference(date_return);
                                          return FineCard(
                                              isbn: l1[index],
                                              bookname: l2[index],
                                              issuedate: issuedate,
                                              returndate: returndate,
                                              days: day.inDays.toString(),
                                              fine: day.inDays * 5, //p
                                              ontap: () async {
                                                var options = {
                                                  'key':
                                                      'rzp_test_7oSEtWonPIbah3',
                                                  'amount': day.inDays *
                                                      500, //in the smallest currency sub-unit.
                                                  'name': 'Bibliotheca',
                                                  'description': 'Paying Fine',
                                                  'timeout': 300, // in seconds
                                                  'prefill': {
                                                    'contact': '',
                                                    'email': ''
                                                  }
                                                };
                                                _razorpay.open(options);
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    DashBoardScreen.id);
                                              });
                                        } else
                                          return Container();
                                      }),
                                );
                              } else if (index ==
                                      snapshots.data!.docs.length - 1 &&
                                  exist == false) {
                                return Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "No fine dues!",
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
      ]),
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
