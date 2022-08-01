import 'dart:core';

import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Components/prop-value_text.dart';
import 'package:bibliotheca/Components/prop-value_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReviewBookCard extends StatefulWidget {
  String isbn;
  String bookName;
  void Function()? onTap;
  // final double width;
  // final double height;
  // final double borderRadius;

  ReviewBookCard(
      {required this.isbn,
      required this.bookName,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  State<ReviewBookCard> createState() => _ReviewBookCardState();
}

class _ReviewBookCardState extends State<ReviewBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      width: 3 * MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.only(left: 22, right: 22, bottom: 20),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 14, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 22, top: 20),
                child: Text(
                  widget.bookName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      height: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: SizedBox(
                  width: 380,
                  height: 1,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12, top: 32, bottom: 33),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: const textProperty(
                          t: 'ISBN Number:',
                          c: black,
                        ),
                        widget2: textValue(
                          t: widget.isbn,
                          c: black,
                        ),
                      ),
                    ),
                    BlueButton(
                        text: "Review Book",
                        width: 200,
                        onTap: widget.onTap,
                        Colour: 0xff545ad8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
