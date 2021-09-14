import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigoAccent,
      ),
      home: InputPage(),
    );
  }
}
