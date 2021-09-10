import 'package:film_finder/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultsPage extends StatefulWidget {
  ResultsPage(this.userInput);

  final String userInput;

  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Finder'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Film Title',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Image.network(
              'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg',
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
