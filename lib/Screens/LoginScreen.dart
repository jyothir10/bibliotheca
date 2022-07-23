import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca/Screens/DashBoardScreen.dart';
import 'package:bibliotheca/Screens/OnboardingScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String mail = "", password = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, OnboardingScreen.id);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Background(),
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
                                  onchanged: (value) {
                                    mail = value;
                                  },
                                ),
                                LoginScreenTextField(
                                  text: "Password",
                                  type: TextInputType.name,
                                  obscure: true,
                                  onchanged: (value) {
                                    password = value;
                                  },
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
                                  width:
                                      MediaQuery.of(context).size.width * .748,
                                  onTap: () {
                                    //todo:sign in
                                    if (mail.isNotEmpty &&
                                        password.isNotEmpty) {
                                      Navigator.pushReplacementNamed(
                                          context, DashBoardScreen.id);
                                    } else {
                                      _scaffoldKey.currentState?.showSnackBar(
                                          const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              duration: Duration(seconds: 1),
                                              content: Text(
                                                  "Invalid username or password")));
                                    }
                                  },
                                ),
                                InkWell(
                                  onTap: () {
                                    //todo:Go to register
                                    Navigator.pushReplacementNamed(
                                        context, RegistrationScreen.id);
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
      ),
    );
  }
}
