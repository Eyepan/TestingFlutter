// needed by articles

class Source {
  String url;
  String name;

  Source({ this.url, this.name});

  // a factory function to parse from json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(url: json['url'], name: json['name']);
  }
}
