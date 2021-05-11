// needed by articles

class Source {
  String id;
  String name;

  Source({ this.id, this.name});

  // a factory function to parse from json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
