import 'package:bibliotheca/constants.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheca/Components/Background.dart';

class ReissueBookScreen extends StatefulWidget {
  static const String id = '/reissue';
  const ReissueBookScreen({Key? key}) : super(key: key);

  @override
  State<ReissueBookScreen> createState() => _ReissueBookScreenState();
}

class _ReissueBookScreenState extends State<ReissueBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back),
                  const Text(
                    'Reissue Book',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 38,
                        letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Container(
                    height: 100,


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
