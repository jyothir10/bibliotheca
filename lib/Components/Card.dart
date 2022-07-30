import 'package:flutter/material.dart';
import 'BlueButton.dart';

class card extends StatefulWidget {
  // final double width;
  // final double height;
  // final double borderRadius;

  const card({Key? key}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      width: 3 * MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.only(left: 22, right: 22, bottom: 20),
      child: Card(
        elevation: 7,
        shape:RoundedRectangleBorder(
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
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textProperty('ISBN Number:'),
                          textValue('978-3-16-148410-0')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textProperty('Issue Date: '),
                          textValue('29-06-2022')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //color: Colors.black87,
                          textProperty('Due Date: '),
                          Text(
                            '15-07-2022',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textProperty('Days Exceeded:'),
                          textValue('20')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, left: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Due Total:',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0025A9),
                            ),),
                          Text(
                            'Rs. 100',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0025A9),
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 145, bottom: 33),
                child: BlueButton(text: 'Proceed', width: 150, onTap: () {},Colour: 0xff545ad8,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget textProperty(String t) {
  return Text(
    t,
    style: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat',
    ),
  );
}

Widget textValue(String t) {
  return Text(
    t,
    style: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat',
    ),
  );
}
