import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/BlueButton.dart';
import 'package:bibliotheca/Screens/ReviewBookScreen.dart';
import 'package:bibliotheca/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewBookScreen1 extends StatefulWidget {
  static const String id = '/review1';
  const ReviewBookScreen1({Key? key}) : super(key: key);

  @override
  State<ReviewBookScreen1> createState() => _ReviewBookScreen1State();
}

class _ReviewBookScreen1State extends State<ReviewBookScreen1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, ReviewBookScreen.id);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            Positioned(
              top: 40,
              left: 18,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Color(0xFF545AD8),
                ),
              ),
            ),
            const Positioned(
              left: 83,
              top: 120,
              child: Text(
                'Review Book',
                style: TextStyle(
                  color: Color(0xFF0025A9),
                  fontSize: 32,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Positioned(
              top: 190,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 560,
                      width: MediaQuery.of(context).size.width * .89,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 560,
                          color: Colors.transparent,
                          child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("images/review.gif"),
                                  Text(
                                    "Book name",
                                    style: TextStyle(
                                        color: Color(0xFF0025A9),
                                        fontSize: 21,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 9),
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 9, horizontal: 9),
                                    child: TextField(
                                      cursorWidth: 1,
                                      cursorColor: primaryColour,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 9,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        focusColor: primaryColour,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(21.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: primaryColour, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(21.0),
                                        ),
                                        label: const Text(
                                          'Write about your experience with the book.',
                                          style: TextStyle(
                                              color: Color(0x59000000),
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              height: 1.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  BlueButton(
                                      text: "Submit",
                                      width: 180,
                                      onTap: () {},
                                      Colour: 0xff545ad8),
                                ],
                              )),
                        ),
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
