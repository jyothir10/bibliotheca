import 'package:bibliotheca/Components/prop-value_text.dart';
import 'package:bibliotheca/Components/prop-value_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../Components/BottomBar.dart';
import '../Components/profile_field_widget.dart';
import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<textValue> value = <textValue>[textValue(t:'Shruti',c:black), textValue(t:'19B123',c:black), textValue(t:'abc@xyz.com',c:black), textValue(t:'+91-123456789',c:black) ];
  final List<textProperty> property = <textProperty>[textProperty(t:'Name :',c:black), textProperty(t:'Admission No.:',c:black), textProperty(t:'E-mail :',c:black), textProperty(t:'Phone :',c:black) ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                      borderRadius : BorderRadius.all(Radius.elliptical(465.34326171875, 358.24896240234375)),
                    )
                ),
              )
          ),
          Positioned(
              top: -146,
              left: -50,
              child: Container(
                  width: 498,
                  height: 358,
                  decoration: BoxDecoration(
                    color : Color(0xff545AD8).withOpacity(0.90),
                    borderRadius : BorderRadius.all(Radius.elliptical(498, 358)),
                  )
              )
          ),
          Positioned(
            left: 12,
            top: 48,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Color(0xFFffffff),
              ),
            ),
          ),
          const Positioned(
            left: 161,
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
            right: 12,
            top: 45,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30,
                color: Color(0xFFffffff),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 140,
            child: CircleAvatar(
            backgroundImage:
            AssetImage("images/profile.jpg"),
            radius: 90,
          ),),
          Positioned(
            top: 310,
            left: 30,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: property.length,
                    itemBuilder: (BuildContext context, int index) {
                  return profileField(w:propValueWidget(widget1: property[index], widget2: value[index],));
                }),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(index: 0,),
    );
  }
}