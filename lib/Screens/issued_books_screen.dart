import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/ib_card.dart';

class IssuedBooks extends StatefulWidget {
  static const String id = '/ib';
  const IssuedBooks({Key? key}) : super(key: key);

  @override
  State<IssuedBooks> createState() => _IssuedBooksState();
}

class _IssuedBooksState extends State<IssuedBooks> {
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
          top: 155,
          left: -80,
          child: Container(
            width: 212,
            height: 204,
            decoration: BoxDecoration(
              color: Color.fromRGBO(84, 90, 216, 0.10000000149011612),
              borderRadius: BorderRadius.all(Radius.elliptical(212, 204)),
            ),
          ),
        ),
        Positioned(
          top: 400,
          right: 30,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xff545ad8),
              borderRadius: BorderRadius.all(Radius.circular((150)),
            ),
          ),
        ),
        ),
        Positioned(
          left: 65, top: 95,
          child: Text(
            'Issued Books',
            style: TextStyle(
              color: Color(0xFF0025A9),
              fontSize: 32,
              fontFamily: 'Montserrat',
            ),
          ),),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:EdgeInsets.only(top: 40,left: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Color(0xFF545AD8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.08*MediaQuery.of(context).size.height,),
              ConstrainedBox(
                constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                child: ListView(
                  children: const [
                    ibCard(),
                    ibCard(),
                    ibCard(),
                    ibCard(),
                    ibCard(),
                  ],
                ),
              )
            ],
          ),
        ),

      ]),
    );
  }
}
