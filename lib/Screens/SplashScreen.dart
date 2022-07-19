import 'dart:async';

import 'package:bibliotheca/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // DateTime? currentBackPressTime;
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //
  // Future<bool> onWillPop() {
  //   DateTime now = DateTime.now();
  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     _scaffoldKey.currentState?.showSnackBar(const SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         duration: Duration(seconds: 1),
  //         content: Text("Press back again to exit")));
  //     return Future.value(false);
  //   }
  //   return Future.value(true);
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //       onWillPop: onWillPop,
  //       child: Scaffold(
  //         key: _scaffoldKey,
  //         body: EasySplashScreen(
  //           showLoader: false,
  //           backgroundColor: const Color(0xff042e60),
  //           logo: Image.asset(
  //             "images/logo.png",
  //           ),
  //           logoSize: MediaQuery.of(context).size.height * .43,
  //           navigator: LoginScreen(),
  //           durationInSeconds: 5,
  //         ),
  //       ));
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, () {
      //Navigate to another screen or anyOther function, like i set duration 4 sec so this function run after 4 sec
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "images/bibliotheca.svg",
              width: MediaQuery.of(context).size.width * .6739,
              height: MediaQuery.of(context).size.height *
                  .279, //just like you define in pubspec.yaml file
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
      ),
    );
  }
}
// SplashScreen(
// navigateAfterSeconds: ,
// seconds: 5,
// backgroundColor:
// image:
// useLoader: false,
// photoSize: MediaQuery.of(context).size.height * .25,
// )
