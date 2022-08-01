import 'package:bibliotheca/Components/Background.dart';
import 'package:flutter/material.dart';

class ReviewBookScreen1 extends StatefulWidget {
  static const String id = '/review1';
  const ReviewBookScreen1({Key? key}) : super(key: key);

  @override
  State<ReviewBookScreen1> createState() => _ReviewBookScreen1State();
}

class _ReviewBookScreen1State extends State<ReviewBookScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Positioned(
            top: 40,
            left: 18,
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
          const Positioned(
            left: 83,
            top: 120,
            child: Text(
              'Review Book',
              style: TextStyle(
                color: Color(0xFF0025A9),
                fontSize: 32,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width * .89,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
