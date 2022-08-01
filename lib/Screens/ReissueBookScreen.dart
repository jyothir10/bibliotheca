import 'package:bibliotheca/Components/Background.dart';
import 'package:bibliotheca/Components/ReissueBookCard.dart';
import 'package:flutter/material.dart';

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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: InkWell(
                        child: const Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        'Reissue Book',
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 38,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    const ReissueBookScreenCard(
                        bookname: 'Artificial Intelligence- A New Synthesis',
                        isbn: 'AC123',
                        issueDate: '29-06-2022',
                        dueDate: '05-07-2022'),
                    const ReissueBookScreenCard(
                        bookname: 'Modern Aspects of Classical Automata Theory',
                        isbn: 'AB3456',
                        issueDate: '29-06-2022',
                        dueDate: '05-07-2022'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
