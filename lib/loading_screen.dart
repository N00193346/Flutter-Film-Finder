import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  LoadingScreen(this.userInput);
  final String userInput;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    String title;
    int year;
    String poster;
    var filmData = [getFilm(widget.userInput)];
    print(filmData[0]);
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

Future<dynamic> getFilm(userInput) async {
  const String apiKey = '7065126bc8a956cc7164ba627aae13d0';
  //Putting the user's search input into a search query
  String searchQuery = userInput;

  String apiUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchQuery';

  //Use dart http package to get a response from the API url
  http.Response response = await http.get(Uri.parse(apiUrl));
  //If the connection to the API is secure
  if (response.statusCode == 200) {
    //Take the JSON response from the API and put it into the value 'data'
    String data = response.body;

    // print(data);

    var decodedData = jsonDecode(data);

    //Decoding the JSON file and passing to variables
    String title = decodedData['results'][0]['original_title'];
    int year = decodedData['results'][0]['release_date'];
    String poster = decodedData['results'][0]['poster_path'];

    var filmDetails = [title, year, poster];

    // return decodedData;
    return filmDetails;
    //Else print the error code
  } else {
    print(response.statusCode);
  }
}

// //Decoding the JSON file and passing to variables
// title = filmData['results'][0]['original_title'];
// year = filmData['results'][0]['release_date'];
// poster = filmData['results'][0]['poster_path'];
