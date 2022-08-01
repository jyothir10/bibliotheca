import 'package:flutter/material.dart';
import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/constants.dart';
import 'package:bibliotheca/Components/NotificationCard.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = '/user_reg';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                       child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 27,
                          color: primaryColour,
                        ),
                       onTap: (){
                         Navigator.pop(context);
                       },
                     ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text('Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          shadows: [
                            BoxShadow(
                              color: Color(0x7fffffff),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    NotificationsCard(time: '10:12 am',details: "System Software is on 03/08/22"),
                    NotificationsCard(time: '07:16 pm',details: "Proramming in C is on 09/08/22"),
                    NotificationsCard(time: '17:44 am',details: "Python Programming is on 27/08/22"),
                    NotificationsCard(time: '02:16 pm',details: "OOP using Java is on 19/09/22"),
                    NotificationsCard(time: '22:52 am',details: "Operating System is on 23/09/22"),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

