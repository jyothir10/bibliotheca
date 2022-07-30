import 'package:flutter/material.dart';
import 'package:bibliotheca/Components/prop-value_widget.dart';
import 'package:bibliotheca/Components/prop-value_text.dart';

import '../constants.dart';

class ibCard extends StatefulWidget {
  // final double width;
  // final double height;
  // final double borderRadius;

  const ibCard({Key? key}) : super(key: key);

  @override
  State<ibCard> createState() => _ibCardState();
}

class _ibCardState extends State<ibCard> {
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
                  'Book Name',
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
                      child: const propValueWidget(
                        widget1: textProperty(
                          t: 'ISBN Number:',
                          c: black,
                        ),
                        widget2: textValue(
                          t: '978-3-16-148410-0',
                          c: black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: const propValueWidget(
                        widget1: textProperty(t: 'Issue Date: ', c: black),
                        widget2: textValue(t: '29-06-2022', c: black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: const propValueWidget(
                        widget1: textProperty(t: 'Due Date: ', c: black),
                        widget2: textValue(t: '15-07-2022', c: Colors.red),
                      ),
                    ),

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
