import 'package:film_finder/results_page.dart';
import 'package:flutter/material.dart';
import 'package:film_finder/film_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  //Using a constructor to take in the user's input from the last screen
  LoadingScreen(this.userInput);
  final String userInput;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    var filmData = getFilm(widget.userInput);
  }

  //Method to display an alert message
  Future<void> searchError() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Could not find any films related to "' +
                widget.userInput +
                '", please try again'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  Future getFilm(userInput) async {
    //Creating a new film object
    FilmData film = FilmData(userInput);
    //Using get filmData method to store data from JSON
    var filmData = await film.getFilmData();

    //If there is more than zero results returned from the API
    //Push the film data to the results page
    if (filmData['total_results'] > 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResultsPage(filmData);
      }));
    } else {
      Navigator.pop(context);
      searchError();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Icon to display while the results are loading
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
