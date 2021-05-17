import 'package:flash_reads/models/article_class.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flash_reads/secrets.dart';

class APIHandler {
  final endPointUrl =
      'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=$apiKey';

  Future<List<Article>> getArticles() async {
    Response response = await get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> body = json['results'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't load articles from " +
          endPointUrl +
          " status : ${response.statusCode}");
    }
  }
}
