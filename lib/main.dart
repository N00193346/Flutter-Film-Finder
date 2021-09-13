import 'package:film_finder/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:film_finder/single_film.dart';

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
