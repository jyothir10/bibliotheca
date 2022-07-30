import 'package:bibliotheca/Components/WhiteButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Components/BlueButton.dart';

class SearchScreenMain extends StatefulWidget {
  static const String id = '/search1';
  const SearchScreenMain({Key? key}) : super(key: key);

  @override
  State<SearchScreenMain> createState() => _SearchScreenMainState();
}

class _SearchScreenMainState extends State<SearchScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Positioned(
          top: 0,
          left: 49,
          child: Container(
              width: 365,
              height: 204,
              child: SvgPicture.asset("images/Group 108.svg")),
        ),
        Positioned(
          left: 12,
          top: 48,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Color(0xFF545AD8),
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: 30,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset("images/search.gif"),
                  width: 200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: const Text(
                    'Search Books By: ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60,bottom: 20),
                  child: WhiteButton(
                    text: 'Book Name',
                    width: 150,
                    onTap: () {},
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 15, right: 20,bottom: 15),
                        child: BlueButton(
                            text: 'Author', width: 150, onTap: () {}, Colour: 0xff545ad8,),
                      ),
                      BlueButton(text: 'Department', width: 150, onTap: () {}, Colour: 0xff545ad8,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
