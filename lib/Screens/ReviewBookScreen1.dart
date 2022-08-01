import 'package:bibliotheca/Components/Background.dart';
import 'package:flutter/material.dart';

class ReviewBookScreen1 extends StatefulWidget {
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
        ],
      ),
    );
  }
}
