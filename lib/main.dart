import 'package:bibliotheca/Screens/DashBoardScreen.dart';
import 'package:bibliotheca/Screens/LoginScreen.dart';
import 'package:bibliotheca/Screens/OnboardingScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen.dart';
import 'package:bibliotheca/Screens/RegistrationScreen2.dart';
import 'package:bibliotheca/Screens/ReissueBookScreen.dart';
import 'package:bibliotheca/Screens/SearchScreen1.dart';
import 'package:bibliotheca/Screens/SearchScreen2.dart';
import 'package:bibliotheca/Screens/SearchScreen3.dart';
import 'package:bibliotheca/Screens/SplashScreen.dart';
import 'package:bibliotheca/Screens/contact_us_screen.dart';
import 'package:bibliotheca/Screens/due_payment.dart';
import 'package:bibliotheca/Screens/issued_books_screen.dart';
import 'package:bibliotheca/Screens/profile_screen.dart';
import 'package:bibliotheca/Screens/search_screen_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: primaryColour,
              ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ProfileScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          RegistrationScreen2.id: (context) => RegistrationScreen2(),
          DashBoardScreen.id: (context) => DashBoardScreen(),
          ContactUs.id: (context) => ContactUs(),
          ReissueBookScreen.id: (context) => ReissueBookScreen(),
          SearchScreenMain.id: (context) => SearchScreenMain(),
          SearchScreen1.id: (context) => SearchScreen1(),
          SearchScreen2.id: (context) => SearchScreen2(),
          SearchScreen3.id: (context) => SearchScreen3(),
          ProfileScreen.id: (context) => ProfileScreen(),
          IssuedBooks.id: (context) => IssuedBooks(),
          DuePaymentScreen.id: (context) => DuePaymentScreen(),
        });
  }
}
