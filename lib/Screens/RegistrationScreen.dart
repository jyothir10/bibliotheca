import 'dart:math' as math;
import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca/Components/blueButton.dart';
import 'package:flutter/material.dart';

import 'RegistrationScreen2.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/user_reg';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  String branch = "EEE";
  String batch = "2k20";
  var branches = ['EEE', 'EC', 'CE', 'CSE', 'ME'];
  var batches = ['2k19', '2k20', '2k21', '2k22'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: -20,
                right: -75,
                child: Transform.rotate(
                  angle: 120 * (math.pi / 180),
                  child: Container(
                    width: 225,
                    height: 251,
                    decoration: BoxDecoration(
                      color: const Color(0xFF545AD8).withOpacity(0.70),
                      borderRadius:
                      const BorderRadius.all(Radius.elliptical(219, 251)),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: -10,
                child: Opacity(
                  opacity: 0.95,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(63, 100, 174, 0.56),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: -50,
                child: Opacity(
                  opacity: 0.48,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xFFD8DAFF),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom == 0 ? CrossAxisAlignment.start : CrossAxisAlignment
                    .center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom == 0 ? Text(
                    'Registration',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 38,
                        letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ) : Container(),
                  Container(
                    child: Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(33),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 400,
                        width: 5 * MediaQuery
                            .of(context)
                            .size
                            .width / 6,
                        child: Column(
                          children: [
                            LoginScreenTextField(
                              text: "Name",
                              type: TextInputType.name,
                              obscure: false,
                              onchanged: (value) {},
                            ),
                            LoginScreenTextField(
                              text: "Admission No",
                              type: TextInputType.name,
                              obscure: false,
                              onchanged: (value) {},
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 45,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .748,
                              decoration: BoxDecoration(
                                color: Color(0xffc8cdd3),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: branch,
                                    iconSize: 22,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Color(0xff2b4f70),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xff2b4f70),
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    items: branches.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items, style: const TextStyle(
                                          color: Color(0xff2b4f70),
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        branch = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 45,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .748,
                              decoration: BoxDecoration(
                                color: Color(0xffc8cdd3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: batch,
                                    iconSize: 22,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Color(0xff2b4f70),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xff2b4f70),
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    items: batches.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items, style: const TextStyle(
                                          color: Color(0xff2b4f70),
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        batch = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              splashColor: const Color(0xff1E88E5),
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, RegistrationScreen2.id);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 28),
                                child: BlueButton(
                                  text: "Continue",
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .546,
                                  onTap: () {
                                    setState((){
                                      Navigator.pushNamed(context, RegistrationScreen2.id);
                                    });
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
