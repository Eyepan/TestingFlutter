import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("FlashReads"),
          backgroundColor: Colors.purple,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewsFeedInstances(
                  "This is the title", "This is the fucking content"),
              NewsFeedInstances(
                  "You can up vote the thing by clicking on the blue button",
                  "Down vote button coming soon"),
              NewsFeedInstances.withoutDetails(),
              NewsFeedInstances.withoutDetails(),
              NewsFeedInstances.withoutDetails(),
              NewsFeedInstances.withoutDetails(),
              NewsFeedInstances.withoutDetails(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.settings,
          ),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}

class NewsFeedInstances extends StatelessWidget {
  String _title = "This title will be supplied by the web scraper to the app";
  String _content =
      "The contents of this news feed will also also be also supplied to this by the web scraper, Lorem ipsum lmao lmao lmao lmao lmao lmao lmao lmao";
  NewsFeedInstances.withoutDetails();
  NewsFeedInstances(String _title, String _content) {
    this._title = _title;
    this._content = _content;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: ElevatedButton(
        onPressed: () {
          print(this._title);
          print(this._content);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        child: Column(
          children: [
            Text(this._title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(this._content,
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(270, 0.0, 0.0, 0.0),
                child: Row(
                  //margin: EdgeInsets.all(8.0),
                  children: [
                    ElevatedButton(
                      onPressed: () {/*Upvote downvote bs*/},
                      child: Icon(Icons.arrow_upward),
                    ),
                    ElevatedButton(
                      onPressed: () {/*Upvote downvote bs*/},
                      child: Icon(Icons.arrow_downward),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
