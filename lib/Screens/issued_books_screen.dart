import 'package:bibliotheca/Components/Background.dart';
import 'package:flutter/material.dart';

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
        Background(),
        const Positioned(
          left: 65,
          top: 95,
          child: Text(
            'Issued Books',
            style: TextStyle(
              color: Color(0xFF0025A9),
              fontSize: 32,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 12),
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
              SizedBox(
                height: 0.08 * MediaQuery.of(context).size.height,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: ListView(
                  children: [
                    ibCard(
                      isbn: "AB123",
                      bookName: "Python",
                      issueDate: "2022-07-06",
                      returnDate: "2022-08-06",
                    ),
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
