import 'multimedia_class.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';

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
  String contents = '';

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

  void addContents(String contents) {
    this.contents = contents;
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    final items = json['multimedia'];
    List<Multimedia> multimediaList = [];

    for (int i = 0; i < items.length; i++) {
      multimediaList.add(Multimedia.fromJSON(items[i]));
    }

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

Future<void> getContents(Article article) async {
  Response response = await get(Uri.parse(article.url));
  var document = parse(response.body);
  var elems = document.getElementsByClassName('css-axufdj evys1bk0');
  var contents = '';
  for (var element in elems) {
    contents += (element.text + '\n');
  }
  article.addContents(contents);
}
