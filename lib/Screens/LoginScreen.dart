import 'package:flutter/material.dart';
import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';


class LoginScreen extends StatefulWidget {
  static const String id ='/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontFamily: 'Montserrat',
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .493,
              width: MediaQuery.of(context).size.width * .908,
              child: Card(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40),),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoginScreenTextField(
                        text: "Username",
                        type: TextInputType.name,
                        obscure: false,
                        onchanged: (value){},
                      ),
                      LoginScreenTextField(
                        text: "Password",
                        type: TextInputType.name,
                        obscure: true,
                        onchanged: (value){},
                      ),
                      const Text('Forgot password?',
                        style: TextStyle(
                          color: Color(0xffa6bcd0),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .066,
                        width: MediaQuery.of(context).size.width * .748,
                        child: const Card(
                          color: Color(0xff545ad8),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20),),
                          ),
                          child: Center(
                            child: Text('SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text('Haven’t Registered Yet?',
                        style: TextStyle(
                          color: Color(0xff2b4f70),
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
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
    ),);
  }
}


