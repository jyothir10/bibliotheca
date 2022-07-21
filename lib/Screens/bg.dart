import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bg extends StatefulWidget {
  static const String id = '/bg';
  const bg({Key? key}) : super(key: key);

  @override
  State<bg> createState() => _bgState();
}

class _bgState extends State<bg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Figma Flutter Generator LoginscreenbgWidget - FRAME
          Container(
        width: 414,
        height: 896,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 155,
                left: -80,
                child: Container(
                    width: 212,
                    height: 204,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(84, 90, 216, 0.10000000149011612),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(212, 204)),
                    ))),
            Positioned(
                top: 262,
                left: 286,
                child: Container(
                    width: 205,
                    height: 211,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25999999046325684),
                            offset: Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(84, 90, 216, 1),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(205, 211)),
                    ))),
            Positioned(
              top: 0,
              left: 49,
              child: Container(
                  width: 365,
                  height: 204,
                  child: SvgPicture.asset("images/Group 108.svg")),
            ),
          ],
        ),
      ),
    );
  }
}
