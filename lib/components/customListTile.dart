import 'package:flutter/material.dart';
import 'package:flutter_app/utils/article_class.dart';
import 'package:flutter_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  if (article.imgUrl != 'null') {
    // print("Not Null, ${article.imgUrl.runtimeType} ${article.imgUrl}");
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(
                      article: article,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(12.0),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(color: Colors.grey[600], blurRadius: 4.0)],
        ),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(article.imgUrl != null
                            ? article.imgUrl
                            : "https://dummyimage.com/600x400/000/fff")),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.amber[600],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Text(article.source.name,
                        style: TextStyle(color: Colors.white))),
                SizedBox(height: 8.0),
                Text(article.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white))
              ]),
        ),
      ),
    );
  } else {
    return Container();
  }
}
