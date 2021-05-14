import 'package:flash_reads/utils/article_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ArticleDetailsPage extends StatelessWidget {
  final Article article;

  // ignore: use_key_in_widget_constructors
  const ArticleDetailsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.multimedia[0].url),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              article.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              article.abstract,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white70),
            ),
            Flexible(
              child: Container(),
            ),
            //TextButton(
            //  onPressed: () {
            //    launch(article.url);
            //  },
            //  child: Text("Goto Article",
            //      style: Theme.of(context).textTheme.bodyText1),
            //),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch(article.url);
        },
        child: const Icon(Icons.open_in_browser),
      ),
    );
  }
}
