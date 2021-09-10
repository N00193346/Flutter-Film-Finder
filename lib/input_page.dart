import 'package:film_finder/constants.dart';
import 'package:film_finder/results_page.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String userInput;

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
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kSearchBar,
              onChanged: (value) {
                //Change the value of the user's input to what is typed in the search bar
                userInput = value;
                print(userInput);
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(userInput);
                }),
              );
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
