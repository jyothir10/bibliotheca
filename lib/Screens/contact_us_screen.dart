import 'dart:math' as math;

import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  static const String id = '/contact_us';
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Color(0xFF545AD8),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 93, top: 20, bottom: 10),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Color(0xFF0025A9),
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: math.pi / 2 + math.pi / 9,
                      child: Blob.fromID(
                        styles: BlobStyles(
                          color: const Color(0xFF545AD8).withOpacity(0.50),
                        ),
                        id: const ['13-6-9822'],
                        size: 380,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("images/male-call-center-operator.gif"),
                      radius: 100,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const card(
                      title: 'Phone Number',
                      subtitle: '+91-8943308141',
                      ic: Icons.phone,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const card(
                          title: 'E-mail ID',
                          subtitle: '19b101@gcek.ac.in',
                          ic: Icons.email_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? ic;

  const card({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.ic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 56.0,
        width: 56.0,
        margin: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F3F3),
          shape: BoxShape.circle,
        ),
        child: Icon(ic, size: 36.0),
      ),
      title: Text(
        '$title',
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
      subtitle: Text(
        '$subtitle',
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
    );
  }
}
