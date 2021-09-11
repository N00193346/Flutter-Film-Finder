import 'package:film_finder/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultsPage extends StatefulWidget {
  ResultsPage(this.filmData);

  final filmData;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  var title;
  var year;
  var yearSub;
  var poster;

  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  void initState() {
    super.initState();
    updateUi(widget.filmData);
  }

  void updateUi(dynamic filmData) {
//Decoding the JSON file and passing to variables
    title = filmData['results'][0]['original_title'];
    year = filmData['results'][0]['release_date'];
    yearSub = year.substring(0, 4);
    poster = filmData['results'][0]['poster_path'];
  }

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
              '$title ($yearSub)',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Image.network(
              '$imageUrl$poster',
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
