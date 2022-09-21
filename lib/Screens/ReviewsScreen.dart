import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/ReviewCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReviewsScreen extends StatefulWidget {
  static const String id = '/reviews';
  String bookno;

  ReviewsScreen({required this.bookno, Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  bool exist = false;
  late QueryDocumentSnapshot<Map<String, dynamic>> reviews;
  List<String> reviewList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            Positioned(
              left: 10,
              top: 48,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: primaryColour,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36, bottom: 27),
                      child: Text(
                        'Reviews',
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
                    Container(
                      height: 617,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Books')
                            .snapshots(),
                        builder: (context, snapshots) {
                          return (snapshots.connectionState ==
                                  ConnectionState.waiting)
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColour,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: snapshots.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var data = snapshots.data!.docs[index]
                                        .data() as Map<String, dynamic>;
                                    if (data['id'] == widget.bookno &&
                                        data['review'] != null) {
                                      List l1 = data['review'];

                                      exist = true;

                                      return Container(
                                        height: 600,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            itemCount: l1.length,
                                            itemBuilder: (context, index) {
                                              return ReviewCard(
                                                  review: l1[index]);
                                            }),
                                      );
                                    } else if (index ==
                                            snapshots.data!.docs.length - 1 &&
                                        exist == false) {
                                      return Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: Text(
                                                "No reviews!",
                                                style:
                                                    dashboardTextStyle.copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
