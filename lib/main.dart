import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("App Loading");
    nouns.take(30).forEach((String element) {
      print(element);
    }); //  47m 20s
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Flutter App"),
        ),
        body: Center(child: Text("This is Body of my First Flutter App")),
      ),
    );
  }
}
