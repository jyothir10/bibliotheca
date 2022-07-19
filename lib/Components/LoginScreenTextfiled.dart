import 'package:flutter/material.dart';

class LoginScreenTextField extends StatelessWidget {

  final String text;
  final void Function(String)? onchanged;
  final TextInputType type;
  final bool obscure;

  const LoginScreenTextField({
    Key? key,
    required this.text,
    required this.onchanged,
    required this.type,
    required this.obscure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .066,
      width: MediaQuery.of(context).size.width * .748,
      child: TextField(
        obscureText: obscure,
        onChanged: onchanged,
        keyboardType: type,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff2b4f70),
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          filled: true,
          fillColor: const Color(0xffc8cdd3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Color(0xff2b4f70),
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}