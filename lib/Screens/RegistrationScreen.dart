import 'dart:math' as math;
import 'package:bibliotheca/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca/Components/blueButton.dart';
import 'package:flutter/material.dart';

enum WidgetMarker { one, two }

class RegistrationScreen extends StatefulWidget {
  static const String id = '/user_reg';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  WidgetMarker selectedCard = WidgetMarker.one;
  bool isChecked1 = false;
  String? password;
  String? password2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: -20,
                right: -75,
                child: Transform.rotate(
                  angle: 120 * (math.pi / 180),
                  child: Container(
                    width: 225,
                    height: 251,
                    decoration: BoxDecoration(
                      color: const Color(0xFF545AD8).withOpacity(0.70),
                      borderRadius:
                      const BorderRadius.all(Radius.elliptical(219, 251)),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: -10,
                child: Opacity(
                  opacity: 0.95,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(63, 100, 174, 0.56),
                      borderRadius:
                      BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: -50,
                child: Opacity(
                  opacity: 0.48,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xFFD8DAFF),
                        borderRadius:
                        BorderRadius.all(Radius.circular(100))
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 35,top: 100),
                  child: const Text(
                    'Registration',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 38,
                        letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                  margin:const EdgeInsets.only(top: 100) ,
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(33))),
                    child: getCustomCard(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCustomCard() {
    switch (selectedCard) {
      case WidgetMarker.one:
        return cardOne();
      case WidgetMarker.two:
        return cardTwo();
    }
  }

  Widget cardOne() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      height: 400,
      width: 5 * MediaQuery.of(context).size.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LoginScreenTextField(
            text: "Name",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          LoginScreenTextField(
            text: "Email",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          LoginScreenTextField(
            text: "Batch",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          const Spacer(),
          InkWell(
            splashColor: const Color(0xff1E88E5),
            onTap: () {
              setState(() {
                selectedCard = WidgetMarker.two;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 26),
              child: blueButton(
                text: "Continue",
                width: MediaQuery.of(context).size.width * .546,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget cardTwo() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      height: 450,
      width: 5 * MediaQuery.of(context).size.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LoginScreenTextField(
            text: "Username",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          LoginScreenTextField(
            text: "Password",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          LoginScreenTextField(
            text: "Re-enter Password",
            type: TextInputType.name,
            obscure: false,
            onchanged: (value){},
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    color: const Color(0xff311B92),
                    child: SizedBox(
                      width: 0.65 * MediaQuery.of(context).size.width,
                      height: 0.7,
                    ),
                  ),
                ),
                CheckboxListTile(
                  value: isChecked1,
                  dense: true,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    'I acknowledge that i have read and agree to the above terms and conditions.',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 6, right: 6, bottom: 22),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = WidgetMarker.one;
                      });
                    },
                    child: Container(
                      width: 181,
                      height: 51,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: const Color(0xd816349b),
                      ),
                      child: const Text(
                        "BACK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = WidgetMarker.one;
                      });
                    },
                    child: InkWell(
                      //highlightColor: Color(),
                      onTap: () {
                        Navigator.pushNamed(context, '/tree_reg');
                      },
                      child: Container(
                        width: 0.45 * MediaQuery.of(context).size.width,
                        height: 51,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: const Color(0xff1AC135),
                        ),
                        child: const Text(
                          "REGISTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Spacer(),
        ],
      ),
    );
  }
}
