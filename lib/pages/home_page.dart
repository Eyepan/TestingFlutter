import 'package:flash_reads/models/article_class.dart';
import 'package:flash_reads/pages/components/news_tile.dart';
import 'package:flash_reads/utils/api_handler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIHandler client = APIHandler();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticles(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles!.length,
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
      },
    ); //FutureBuilder(),
  }
}
