// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_app/constants.dart' as consts;

import 'article_class.dart';

// ignore: camel_case_types
class API_Requester {
  final endPointUrl =
      'https://gnews.io/api/v4/top-headlines?token=6f78ff796453389a2cb76da91c7982fc&country=in';

  Future<List<Article>> getArticles() async {
    Response response = await get(endPointUrl);

    // newsAPI specific response code 200
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJSON(item)).toList();

      return articles;
    } else {
      throw ("Can't load articles from NewsAPI");
    }
  }
}
