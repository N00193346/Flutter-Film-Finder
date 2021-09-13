import 'package:flutter/material.dart';

class SingleFilm extends StatelessWidget {
  SingleFilm(this.title, this.releaseDate, this.description, this.poster);

  final String title;
  final String releaseDate;
  final String description;
  final String poster;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

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
                '$title',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Image.network(
                '$imageUrl' + '$poster',
                height: 350,
              ),
              Text(
                'Release Date: $releaseDate',
                style: TextStyle(fontSize: 24),
              ),
              Text('$description')
            ],
          ),
        ));
  }
}
