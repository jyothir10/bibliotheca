import 'package:bibliotheca/Screens/DashBoardScreen.dart';
import 'package:bibliotheca/Screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  final int index;
  const BottomBar({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final pages = [
    DashBoardScreen.id,
    DashBoardScreen.id,
    DashBoardScreen.id,
    ProfileScreen.id,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacementNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: BottomNavigationBar(
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.index,
        selectedLabelStyle: const TextStyle(
          color: Color(0x33042e60),
          fontSize: 9.45121955871582,
          fontFamily: 'SFUIText',
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xff042e60),
          fontSize: 9.45121955871582,
          fontFamily: 'SFUIText',
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/bottomnavigationbar/home.svg',
                height: 23,
              ),
              label: ' Home',
              activeIcon: SvgPicture.asset(
                'images/bottomnavigationbar/home1.svg',
                height: 23,
              )),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/history.svg',
              height: 23,
            ),
            label: ' History',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/history1.svg',
              height: 23,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/notification.svg',
              height: 23,
            ),
            label: 'Notifications',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/notification1.svg',
              height: 23,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/profile.svg',
              height: 23,
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/profile1.svg',
              height: 23,
            ),
          ),
        ],
        elevation: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
