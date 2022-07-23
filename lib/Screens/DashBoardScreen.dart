import 'package:bibliotheca/Components/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                      color: Color.fromRGBO(84, 90, 216, 0.10000000149011612),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(212, 204)),
                    ),
                  ),
                ),
                Positioned(
                    top: 262,
                    left: 286,
                    child: Container(
                        width: 205,
                        height: 211,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.25999999046325684),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: Color(0xFF545AD8).withOpacity(0.90),
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
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/renewal.svg",
                        text: 'Renew Book',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/search.svg",
                        text: 'Search Books',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/review.svg",
                        text: 'Review Books',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/fine.svg",
                        text: 'Pay Fine',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/help.svg",
                        text: 'Help & Support',
                        onTap: () {},
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
