import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final double width;
  final int Colour;
  void Function()? onTap;
  BlueButton({
    required this.text,
    required this.width,
    required this.onTap,
    Key? key, required this.Colour,
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        child: Card(
          color: Color(Colour),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
