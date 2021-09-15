import 'package:flutter/material.dart';
import 'package:film_finder/film.dart';
import 'package:film_finder/single_film.dart';

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

  //The first part of the url is stored in variable as the API JSON only stores the second half
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  void initState() {
    super.initState();

    // updateUi(widget.filmData);
    // getFilms();
  }

  @override
  Widget build(BuildContext context) {
    //Using WillPopScope widget to make sure the user cannot return to the loading page
    //The widget will pop over the loading page and return to the search page
    return WillPopScope(
      onWillPop: () async {
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 2);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Film Finder'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: ListView.builder(
            //Check to see if there is any results, if there is, loop as long as the results
            itemCount: widget.filmData['results'] == null
                ? 0
                : widget.filmData['results'].length,
            itemBuilder: (BuildContext context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //Pushing all the films information to the next page if the user taps on the film
                        return SingleFilm(
                            widget.filmData['results'][i]['original_title'],
                            widget.filmData['results'][i]['release_date'],
                            widget.filmData['results'][i]['overview'],
                            widget.filmData['results'][i]['poster_path']);
                      },
                    ),
                  );
                },
                child: Column(children: [
                  //Checking to see if each variable is null before passing the data
                  //Title
                  widget.filmData['results'][i]['original_title'] != null
                      ? Text(widget.filmData['results'][i]['original_title'],
                          style: TextStyle(color: Colors.white, fontSize: 30))
                      : Text('null value',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                  //Release Data
                  //The release date in the JSON doesn't contain any nulls, only empty strings
                  widget.filmData['results'][i]['release_date'] != ''
                      ? Text(
                          '(' +
                              widget.filmData['results'][i]['release_date']
                                  .substring(0, 4) +
                              ')',
                          style: TextStyle(color: Colors.white, fontSize: 32))
                      : Text('null value'),
                  //Image
                  widget.filmData['results'][i]['poster_path'] != null
                      //The first and second parts of the url need to be concatenated to display the image
                      ? Image.network(
                          '$imageUrl' +
                              widget.filmData['results'][i]['poster_path'],
                          height: 350,
                        )
                      //This sized box will be used if a film has no image attached to it
                      : SizedBox(
                          height: 350,
                          child: Text('No related image'),
                        ),
                  //This sized box will be used to create some space between the film displayed
                  SizedBox(
                    height: 30,
                  )
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Attempt using future builder
// child: FutureBuilder(
// future: getFilms(),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// return ListView.builder(
// //Check to see if there is any results, if there is, loop as long as the results
// itemCount: snapshot.data == null ? 0 : snapshot.data.length,
// itemBuilder: (BuildContext context, i) {
// return GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// //Pushing all the films information to the next page if the user press on the movie
// return SingleFilm(
// widget.filmData['results'][i]['original_title'],
// widget.filmData['results'][i]['release_date'],
// widget.filmData['results'][i]['overview'],
// widget.filmData['results'][i]['poster_path']);
// },
// ),
// );
// },

//A method that loops through the API results, creates a film object and add the results to a film array
//This method is is not need with a ListView builder
// Future<List<Film>> getFilms() async {
//   var filmData = widget.filmData;
//
//   List<Film> films = [];
//   for (var i = 0; i < filmData['results'].length; i++) {
//     Film film = Film(
//         filmData['results'][i]['original_title'],
//         filmData['results'][i]['release_date'],
//         filmData['results'][i]['poster_path']);
//     films.add(film);
//   }
//   print(films.length);
//   return films;
// }

// //This function was used to test decoding the data from the JSON
// void updateUi(dynamic filmData) {
// //Decoding the JSON file and passing to variables
//   title = filmData['results'][0]['original_title'];
//   year = filmData['results'][0]['release_date'];
//   yearSub = year.substring(0, 4);
//   poster = filmData['results'][0]['poster_path'];
// }
