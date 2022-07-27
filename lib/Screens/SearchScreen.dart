import 'package:bibliotheca/Components/Background.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String id = '/splash';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Background(),
            Positioned(
              top: 30,
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 57,
                        width: MediaQuery.of(context).size.width * .85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0x38000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4c000000),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 500,
                        width: MediaQuery.of(context).size.width * .7,
                        child: Image.asset("images/searching.gif"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
