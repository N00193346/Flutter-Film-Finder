import 'package:flutter/material.dart';
import 'package:film_finder/film.dart';
import 'package:film_finder/single_film.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(this.filmData);

  final filmData;
  List<Column> films = [];

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
    getFilms();
  }

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

  Future<List<Film>> getFilms() async {
    var filmData = widget.filmData;

    List<Film> films = [];
    for (var f in filmData) {
      Film film =
          Film(f['original_title'], f['release_date'], f['poster_path']);
      films.add(film);
    }
    print(films.length);
    return films;
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
        child: ListView.builder(
//Check to see if there is any results, if there is, loop as long as the results
          itemCount: widget.filmData['results'] == null
              ? 0
              : widget.filmData['results'].length,
          itemBuilder: (BuildContext context, i) {
            //If the film object contains a poster
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //Pushing all the films information to the next page if the user press on the movie
                      return SingleFilm(
                          widget.filmData['results'][i]['poster_path'],
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
                    ? Image.network(
                        '$imageUrl' +
                            widget.filmData['results'][i]['poster_path'],
                        height: 350,
                      )
                    : SizedBox(
                        height: 350,
                        child: Text('No related image'),
                      ),
                SizedBox(
                  height: 30,
                )
              ]),
            );
            //Else if it does not contain a poster
          },
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
// child: Column(children: [
// Text(snapshot.data[index],
// style: TextStyle(color: Colors.white, fontSize: 30)),
// Text(
// '(' +
// widget.filmData['results'][i]['release_date']
//     .substring(0, 4) +
// ')',
// style: TextStyle(color: Colors.white, fontSize: 32)),
// Image.network(
// '$imageUrl' +
// widget.filmData['results'][i]['poster_path'],
// height: 350,
// ),
// SizedBox(
// height: 30,
// )
// ]),
// );
// },
// );
// },
// ),
