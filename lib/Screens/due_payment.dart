import 'package:flutter/material.dart';
import 'package:bibliotheca/Components/card.dart';
import 'dart:math' as math;
import 'package:razorpay_flutter/razorpay_flutter.dart';
//import 'package:intl/intl.dart';

class DuePaymentScreen extends StatefulWidget {
  static const String id = '/pay_due';
  const DuePaymentScreen({Key? key}) : super(key: key);

  @override
  DuePaymentScreenState createState() => DuePaymentScreenState();
}

class DuePaymentScreenState extends State<DuePaymentScreen> {
  final _razorpay = Razorpay();


  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }



  var options = {
    'key': 'rzp_test_7oSEtWonPIbah3',
    'amount': 500, //in the smallest currency sub-unit.
    'name': 'Bibliotheca',
    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
    'description': 'Paying FIne',
    'timeout': 60, // in seconds
    'prefill': {
      'contact': '9123456789',
      'email': 'gaurav.kumar@example.com'
    }
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

  @override
  Widget build(BuildContext context) {
    //final now = new DateTime.now();
    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint(e.toString());
    }
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
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(215, 224)),
                ))),
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
            left: 65, top: 85,
          child: Text(
            'Pay Fine',
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
                margin:EdgeInsets.only(top: 35,left: 10),
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
              SizedBox(height: 0.08*MediaQuery.of(context).size.height,),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 100),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    card(ontap: () {
                      var options = {
                        'key': 'rzp_test_7oSEtWonPIbah3',
                        'amount': 500, //in the smallest currency sub-unit.
                        'name': 'Bibliotheca',
                        'description': 'Pay fine',
                        'timeout': 300, // in seconds
                        'prefill': {
                          'contact': '',
                          'email': ''
                        }
                      };
                      _razorpay.open(options);
                    },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }
}
