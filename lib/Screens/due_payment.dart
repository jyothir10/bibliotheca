import 'dart:math' as math;

import 'package:bibliotheca/Components/card.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class DuePaymentScreen extends StatefulWidget {
  static const String id = '/pay_due';
  const DuePaymentScreen({Key? key}) : super(key: key);

  @override
  DuePaymentScreenState createState() => DuePaymentScreenState();
}

class DuePaymentScreenState extends State<DuePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    //final now = new DateTime.now();

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
        Positioned(
          left: 15,
          top: 38,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Color(0xFF545AD8),
            ),
          ),
        ),
        Positioned(
          left: 65,
          top: 85,
          child: const Text(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .18,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 150),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    card(),
                    card(),
                    card(),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
