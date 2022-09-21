import 'dart:math' as math;

import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Components/prop-value_text.dart';
import 'package:bibliotheca/Components/prop-value_widget.dart';
import 'package:bibliotheca/Screens/OnboardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Components/BottomBar.dart';
import '../Components/profile_field_widget.dart';
import '../constants.dart';
import 'DashBoardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool showspinner = true;
  String? admno = "";
  String name="",email = "";
  Map data = Map<String, dynamic>();


  final List<textProperty> property = <textProperty>[
    textProperty(t: 'Name :', c: black),
    textProperty(t: 'Admission No :', c: black),
    textProperty(t: 'E-mail :', c: black),
  ];

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    admno = prefs.getString('id');

    final docRef = FirebaseFirestore.instance.collection('Students').doc(admno);
    docRef.get().then(
          (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
        name = data['name'];
        email = data['email'];
        if(email.isNotEmpty){
          setState((){
            showspinner = false;
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, OnboardingScreen.id);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, DashBoardScreen.id);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showspinner,
          progressIndicator: const CircularProgressIndicator(
            color: primaryColour,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: -80,
                  left: -75,
                  child: Transform.rotate(
                    angle: 5.461800904670572 * (math.pi / 180),
                    child: Container(
                        width: 465.34326171875,
                        height: 358.24896240234375,
                        decoration: BoxDecoration(
                          color: Color(0xff545AD8).withOpacity(0.20),
                          borderRadius: BorderRadius.all(Radius.elliptical(
                              465.34326171875, 358.24896240234375)),
                        )),
                  )),
              Positioned(
                  top: -146,
                  left: -50,
                  child: Container(
                      width: 498,
                      height: 358,
                      decoration: BoxDecoration(
                        color: Color(0xff545AD8).withOpacity(0.90),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(498, 358)),
                      ))),
              const Positioned(
                left: 155,
                top: 58,
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 140,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/person.jpg"),
                  radius: 90,
                ),
              ),
              Positioned(
                top: 270,
                left: 30,
                child: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: property.length,
                            itemBuilder: (BuildContext context, int index) {
                              final List<textValue> value = <textValue>[
                                textValue(t: name, c: black),
                                textValue(t: admno.toString(), c: black),
                                textValue(t: email, c: black),
                              ];
                              return profileField(
                                  w: propValueWidget(
                                widget1: property[index],
                                widget2: value[index],
                              ));
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: BlueButton(
                            text: "Logout",
                            width: MediaQuery.of(context).size.width * .43,
                            onTap: () {
                              _signOut();
                            },
                            Colour: 0xff545ad8,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: 3,
        ),
      ),
    );
  }
}
