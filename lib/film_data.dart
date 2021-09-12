//Renaming http package to make functions more clear
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilmData {
  FilmData(this.userInput);

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

      var decodedData = jsonDecode(data);
      return decodedData;

      //Else print the error code
    } else {
      print(response.statusCode);
    }
  }
}
