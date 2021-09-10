import 'package:film_finder/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage(this.userInput);

  final String userInput;

  String imageUrl =
      'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_FMjpg_UX1000_.jpg';

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
              '$userInput',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Image.network(
              imageUrl,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
