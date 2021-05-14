class Multimedia {
  String url;
  String format;
  int height;
  int width;
  String type;
  String subtype;
  String caption;
  String copyright;

  Multimedia(
      {required this.url,
      required this.format,
      required this.height,
      required this.width,
      required this.type,
      required this.subtype,
      required this.caption,
      required this.copyright});

  factory Multimedia.fromJSON(Map<String, dynamic> json) {
    return Multimedia(
      url: json['url'],
      format: json['format'],
      height: json['height'],
      width: json['width'],
      type: json['type'],
      subtype: json['subtype'],
      caption: json['caption'],
      copyright: json['copyright'],
    );
  }
}
