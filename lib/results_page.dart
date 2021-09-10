import 'package:film_finder/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultsPage extends StatelessWidget {
  ResultsPage(this.userInput);

  final String userInput;

  String imageUrl =
      'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_FMjpg_UX1000_.jpg';

  @override
  Widget build(BuildContext context) {
    getFilm(userInput);
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

void getFilm(userInput) async {
  final String apiKey = '7065126bc8a956cc7164ba627aae13d0';
  final String searchQuery = userInput;

  final String apiExample =
      'https://api.themoviedb.org/3/search/movie?api_key=7065126bc8a956cc7164ba627aae13d0&query=$searchQuery';

  http.Response response = await http.get(Uri.parse(apiExample));
  if (response.statusCode == 200) {
    String data = response.body;
    print(data);
  } else {
    print(response.statusCode);
  }
}
