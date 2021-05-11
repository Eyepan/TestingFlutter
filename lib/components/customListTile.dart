import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart' as consts;
import 'package:flutter_app/utils/article_class.dart';

Widget customListTile(Article article) {
  return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(12.0),
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [BoxShadow(color: Colors.grey[600], blurRadius: 4.0)],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
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
          ]));
}
