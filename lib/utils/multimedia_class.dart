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
      {this.url,
      this.format,
      this.height,
      this.width,
      this.type,
      this.subtype,
      this.caption,
      this.copyright});

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
