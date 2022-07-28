import 'package:flutter/material.dart';
import 'package:news_api/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

//token
//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

