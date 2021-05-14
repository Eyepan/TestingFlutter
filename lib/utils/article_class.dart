import 'multimedia_class.dart';

class Article {
  String section;
  String subsection;
  String title;
  String abstract;
  String url;
  String uri;
  String byline;
  String itemType;
  String updatedDate;
  String createdDate;
  String publishedDate;
  String materialTypeFacet;
  String kicker;
  List<dynamic> desFacet;
  List<dynamic> orgFacet;
  List<dynamic> perFacet;
  List<dynamic> geoFacet;
  List<Multimedia> multimedia;
  String shortUrl;

  Article(
      {required this.section,
      required this.subsection,
      required this.title,
      required this.abstract,
      required this.url,
      required this.uri,
      required this.byline,
      required this.itemType,
      required this.updatedDate,
      required this.createdDate,
      required this.publishedDate,
      required this.materialTypeFacet,
      required this.kicker,
      required this.desFacet,
      required this.orgFacet,
      required this.perFacet,
      required this.geoFacet,
      required this.multimedia,
      required this.shortUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    final items = json['multimedia'];
    List<Multimedia> multimediaList = [];

    for (int i = 0; i < items.length; i++) {
      multimediaList.add(Multimedia.fromJSON(items[i]));
    }

    final contents;
    return Article(
        section: json['section'],
        subsection: json['subsection'],
        title: json['title'],
        abstract: json['abstract'],
        url: json['url'],
        uri: json['uri'],
        byline: json['byline'],
        itemType: json['item_type'],
        updatedDate: json['updated_date'],
        createdDate: json['created_date'],
        publishedDate: json['published_date'],
        materialTypeFacet: json['material_type_facet'],
        kicker: json['kicker'],
        desFacet: json['des_facet'],
        orgFacet: json['org_facet'],
        perFacet: json['per_facet'],
        geoFacet: json['geo_facet'],
        multimedia: multimediaList,
        shortUrl: json['short_url']);
  }
}
