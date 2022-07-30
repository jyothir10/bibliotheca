import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Components/WhiteButton.dart';
import 'package:bibliotheca/Screens/LoginScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text("Press back again to exit")));
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Hero(
                    tag: "logo",
                    child: SvgPicture.asset(
                      "images/logo.svg",
                      width: MediaQuery.of(context).size.width * .6739,
                      height: MediaQuery.of(context).size.height *
                          .279, //just like you define in pubspec.yaml file
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Bibiliotheca',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BlueButton(
                    text: "Register",
                    width: MediaQuery.of(context).size.width * .5,
                    onTap: () {
                      //todo: nav to registering
                      Navigator.pushReplacementNamed(
                          context, RegistrationScreen.id);
                    }, Colour: 0xff545ad8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: WhiteButton(
                      text: "Login",
                      width: MediaQuery.of(context).size.width * .5,
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
