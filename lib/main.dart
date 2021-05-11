import 'package:flutter/material.dart';
import 'package:flutter_app/components/customListTile.dart';
import 'package:flutter_app/utils/api_requester.dart';
import 'package:flutter_app/utils/article_class.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  API_Requester client = API_Requester();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("FlashReads",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          child: FutureBuilder(
              future: client.getArticles(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {


                if (snapshot.hasData) {
                  List<Article> articles = snapshot.data;
                  return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (BuildContext context, index) =>
                          customListTile(articles[index], context));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                
              }),
        ),
      ),
    );
  }
}
