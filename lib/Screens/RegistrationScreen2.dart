import 'dart:math' as math;

import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca/Screens/DashBoardScreen.dart';
import 'package:bibliotheca/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen2 extends StatefulWidget {
  static const String id = '/reg2';
  String? admno;

  RegistrationScreen2({this.admno, Key? key}) : super(key: key);

  @override
  RegistrationScreen2State createState() => RegistrationScreen2State();
}

class RegistrationScreen2State extends State<RegistrationScreen2> {
  bool isChecked1 = false;
  bool showSpinner = false;
  String? password;
  String? password2;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordcontroller1 = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future signUp() async {
    print(widget.admno);
    setState(() {
      showSpinner = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      final student =
          FirebaseFirestore.instance.collection('Students').doc(widget.admno);
      student.update({'email': emailcontroller.text});
      Navigator.pushReplacementNamed(context, DashBoardScreen.id);
      setState(() {
        showSpinner = false;
      });
    } on FirebaseException catch (e) {
      print(e);
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text(
            e.message.toString(),
          ),
        ),
      );
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    passwordcontroller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          color: primaryColour,
        ),
        child: Stack(
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
                  crossAxisAlignment:
                      MediaQuery.of(context).viewInsets.bottom == 0
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? const Text(
                            'Registration',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 38,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )
                        : Container(),
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
                          height: 420,
                          width: 5 * MediaQuery.of(context).size.width / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LoginScreenTextField(
                                mycontroller: emailcontroller,
                                text: "Email",
                                type: TextInputType.emailAddress,
                                obscure: false,
                                onchanged: (value) {},
                              ),
                              LoginScreenTextField(
                                mycontroller: passwordcontroller,
                                text: "Password",
                                type: TextInputType.name,
                                obscure: true,
                                onchanged: (value) {},
                              ),
                              LoginScreenTextField(
                                mycontroller: passwordcontroller1,
                                text: "Re-enter Password",
                                type: TextInputType.name,
                                obscure: false,
                                onchanged: (value) {},
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        color: const Color(0xff311B92),
                                        child: SizedBox(
                                          width: 0.65 *
                                              MediaQuery.of(context).size.width,
                                          height: 0.7,
                                        ),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      value: isChecked1,
                                      dense: true,
                                      activeColor: Color(0xd816349b),
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked1 = value!;
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text(
                                        'I acknowledge that i have read and agree to the above terms and conditions.',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 6, right: 6, bottom: 22),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: 0.45 *
                                              MediaQuery.of(context).size.width,
                                          height: 51,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                            color: primaryColour,
                                          ),
                                          child: const Text(
                                            "BACK",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: InkWell(
                                          //highlightColor: Color(),
                                          onTap: () {
                                            if (emailcontroller
                                                    .text.isNotEmpty &&
                                                passwordcontroller
                                                    .text.isNotEmpty &&
                                                passwordcontroller.text ==
                                                    passwordcontroller1.text) {
                                              signUp();
                                            } else {
                                              _scaffoldKey.currentState
                                                  ?.showSnackBar(const SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                          "Please enter valid gmail and password")));
                                            }
                                          },
                                          child: Container(
                                            width: 0.45 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            height: 51,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0x3f000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              color: const Color(0xff1AC135),
                                            ),
                                            child: const Text(
                                              "REGISTER",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Spacer(),
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
      ),
    );
  }
}
