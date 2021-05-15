import 'package:flash_reads/utils/article_class.dart';
import 'package:flutter/material.dart';
import 'package:flash_reads/utils/api_handler.dart';
import 'package:flash_reads/pages/components/news_tile.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIHandler client = APIHandler();
  //Future<List<Article>> articles;
  @override
  void initState() {
    //articles = client.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: FutureBuilder(
            future: client.getArticles(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                List<Article> articles = snapshot.data;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (BuildContext context, index) =>
                      newsTile(articles[index], context),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "${snapshot.error} ${snapshot.data} ${snapshot.stackTrace}"),
                );
              }
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }) //FutureBuilder(),
        );
  }
}
