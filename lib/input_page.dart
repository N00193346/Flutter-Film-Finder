import 'package:film_finder/constants.dart';
import 'package:film_finder/loading_screen.dart';

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //The user's input needs to be initialized as an empty string
  // because if the user accidentally presses the
  // search bar before entering any text the app will crash
  late String userInput = '';

  //Method to display an alert message
  Future<void> searchError() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter text into the search bar'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Finder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            //TextField for the user to enter the film they would like to search for
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kSearchBar,
              onChanged: (value) {
                //Change the value of the user's input to what is typed in the search bar
                userInput = value;
              },
            ),
          ),
          TextButton(
            //When the search button is pressed, the user's input will be pushed onto the loading screen
            onPressed: () {
              //If the search bar is empty, alert the user
              if (userInput == '') {
                searchError();
                //Else push the data in the search bar to the loading screen
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoadingScreen(userInput);
                  }),
                );
              }
            },
            child: Text('SEARCH'),
            style: TextButton.styleFrom(
              primary: Colors.yellowAccent,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
