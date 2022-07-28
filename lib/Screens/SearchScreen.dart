import 'package:bibliotheca/Components/Background.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String id = '/splash';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Background(),
          ],
        ));
  }
}
