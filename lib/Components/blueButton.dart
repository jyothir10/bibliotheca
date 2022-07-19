import 'package:flutter/material.dart';

class blueButton extends StatelessWidget {

  final String text;
  final double width;
  const blueButton({
    required this.text,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .066,
      width: width,
      child: Card(
        color: Color(0xff545ad8),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20),),
        ),
        child: Center(
          child: Text(text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}