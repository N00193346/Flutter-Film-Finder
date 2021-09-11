//Renaming http package to make functions more clear
import 'package:http/http.dart' as http;
import 'dart:convert';

class Film {
  Film(this.userInput);

  final String userInput;

  final String apiKey = '7065126bc8a956cc7164ba627aae13d0';
  late String apiUrl;

  Future getFilmData() async {
    //Putting the user's search input into a search url
    apiUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$userInput';

    //Use dart http package to get a response from the API url
    http.Response response = await http.get(Uri.parse(apiUrl));
    //If the connection to the API is secure
    if (response.statusCode == 200) {
      //Take the JSON response from the API and put it into the value 'data'
      String data = response.body;

      // print(data);

      var decodedData = jsonDecode(data);
      return decodedData;

      // //Decoding the JSON file and passing to variables
      // var title = decodedData['results'][0]['original_title'];
      // var year = decodedData['results'][0]['release_date'];
      // var poster = decodedData['results'][0]['poster_path'];

      //Else print the error code
    } else {
      print(response.statusCode);
    }
  }
}
// //Decoding the JSON file and passing to variables
// title = filmData['results'][0]['original_title'];
// year = filmData['results'][0]['release_date'];
// poster = filmData['results'][0]['poster_path'];

// String title;
// int year;
// String poster;
// var filmData = [getFilm(widget.userInput)];
// print(filmData[0]);

// final String apiKey = '7065126bc8a956cc7164ba627aae13d0';
// late String searchQuery;
// late String apiUrl;
//
// //Putting the user's search input into a search query
// searchQuery = await userInput;
//
// apiUrl =
//     'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchQuery';
//
// //Use dart http package to get a response from the API url
// http.Response response = await http.get(Uri.parse(apiUrl));
// //If the connection to the API is secure
// if (response.statusCode == 200) {
//   //Take the JSON response from the API and put it into the value 'data'
//   String data = response.body;
//
//   var decodedData = jsonDecode(data);
//
//   //     //Decoding the JSON file and passing to variables
//   var title = decodedData['results'][0]['original_title'];
//   var year = decodedData['results'][0]['release_date'];
//   var poster = decodedData['results'][0]['poster_path'];
//
//   print(title);
//   print(year);
//   print(poster);
// } else {
//   print(response.statusCode);
// }
