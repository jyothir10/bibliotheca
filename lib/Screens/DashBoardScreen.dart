import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/BottomBar.dart';
import 'package:bibliotheca/Screens/ReissueBookScreen.dart';
import 'package:bibliotheca/Screens/ReviewBookScreen.dart';
import 'package:bibliotheca/Screens/contact_us_screen.dart';
import 'package:bibliotheca/Screens/due_payment.dart';
import 'package:bibliotheca/Screens/issued_books_screen.dart';
import 'package:bibliotheca/Screens/search_screen_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Components/DashBoardCard.dart';

class DashBoardScreen extends StatefulWidget {
  static const String id = '/dashboard';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(
        index: 0,
      ),
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    18, MediaQuery.of(context).size.height * .1, 18, 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 21),
                    children: [
                      DashBoardCard(
                        img: "images/dashboard/issue.svg",
                        text: 'Issued Books',
                        onTap: () {
                          Navigator.pushNamed(context, IssuedBooks.id);
                        },
                      ),
                      DashBoardCard(
                        img: "images/dashboard/renewal.svg",
                        text: 'Renew Book',
                        onTap: () {
                          Navigator.pushNamed(context, ReissueBookScreen.id);
                        },
                      ),
                      DashBoardCard(
                        img: "images/dashboard/search.svg",
                        text: 'Search Books',
                        onTap: () {
                          Navigator.pushNamed(context, SearchScreenMain.id);
                        },
                      ),
                      DashBoardCard(
                        img: "images/dashboard/review.svg",
                        text: 'Review Books',
                        onTap: () {
                          Navigator.pushNamed(context, ReviewBookScreen.id);
                        },
                      ),
                      DashBoardCard(
                        img: "images/dashboard/fine.svg",
                        text: 'Pay Fine',
                        onTap: () {
                          Navigator.pushNamed(context, DuePaymentScreen.id);
                        },
                      ),
                      DashBoardCard(
                        img: "images/dashboard/help.svg",
                        text: 'Help & Support',
                        onTap: () {
                          Navigator.pushNamed(context, ContactUs.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
