import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: 414,
            height: 896,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 155,
                    left: -80,
                    child: Container(
                        width: 212,
                        height: 204,
                        decoration: BoxDecoration(
                          color:
                              Color.fromRGBO(84, 90, 216, 0.10000000149011612),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(212, 204)),
                        ))),
                Positioned(
                    top: 262,
                    left: 286,
                    child: Container(
                        width: 205,
                        height: 211,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.25999999046325684),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(84, 90, 216, 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(205, 211)),
                        ))),
                Positioned(
                  top: 0,
                  left: 49,
                  child: Container(
                      width: 365,
                      height: 204,
                      child: SvgPicture.asset("images/Group 108.svg")),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Positioned(
                        bottom: 50,
                        right: -10,
                        child: Opacity(
                          opacity: 0.95,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(63, 100, 174, 0.56),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .493,
                      width: MediaQuery.of(context).size.width * .908,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Card(
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LoginScreenTextField(
                                text: "College mail",
                                type: TextInputType.name,
                                obscure: false,
                                onchanged: (value) {},
                              ),
                              LoginScreenTextField(
                                text: "Password",
                                type: TextInputType.name,
                                obscure: true,
                                onchanged: (value) {},
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Color(0xffa6bcd0),
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              BlueButton(
                                text: "SIGN IN",
                                width: MediaQuery.of(context).size.width * .748,
                                onTap: () {
                                  //todo:sign in
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  //todo:Go to register
                                },
                                child: const Text(
                                  'Haven’t Registered Yet?',
                                  style: TextStyle(
                                    color: Color(0xff2b4f70),
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              //: Container(),
                            ],
                          ),
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
    );
  }
}
