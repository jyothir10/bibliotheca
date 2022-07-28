import 'package:bibliotheca/Screens/DashBoardScreen.dart';
import 'package:bibliotheca/Screens/LoginScreen.dart';
import 'package:bibliotheca/Screens/OnboardingScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen2.dart';
import 'package:bibliotheca/Screens/SplashScreen.dart';
import 'package:bibliotheca/Screens/due_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/contact_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DuePaymentScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          RegistrationScreen2.id: (context) => RegistrationScreen2(),
          ContactUs.id: (context) => ContactUs(),
          DuePaymentScreen.id: (context) => DuePaymentScreen(),
          DashBoardScreen.id: (context) => DashBoardScreen(),
        });
  }
}
