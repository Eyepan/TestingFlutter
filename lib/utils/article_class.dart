import 'source_class.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String imgUrl;
  String publishedAt;
  String contents;

  Article(
      { this.source,
       this.author,
       this.title,
       this.description,
       this.url,
       this.imgUrl,
       this.publishedAt,
       this.contents});

  // same deal as factory function
  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        imgUrl: json['urlToImage'],
        publishedAt: json['publishedAt'],
        contents: json['content']);
  }
}
