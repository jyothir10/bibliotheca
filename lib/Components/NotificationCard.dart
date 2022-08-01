import 'package:flutter/material.dart';

class NotificationsCard extends StatelessWidget {
  final String time;
  final String details;
  const NotificationsCard({Key? key, required this.time, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Center(
        child: Container(
          height: 85,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0x3f68706e),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 1),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Due date is near !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70),
                  child: Text(
                    "Due date for the book $details",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
