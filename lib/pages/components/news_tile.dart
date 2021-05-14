import 'package:flash_reads/pages/article_details.dart';
import 'package:flutter/material.dart';
import 'package:flash_reads/utils/article_class.dart';

Widget newsTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetailsPage(article: article)));
    },
    child: Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(12.0),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4.0)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  article.multimedia[0].url,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(article.title, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    ),
  );
}
