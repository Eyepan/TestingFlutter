import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_reads/pages/article_details.dart';
import 'package:flutter/material.dart';
import 'package:flash_reads/utils/article_class.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Widget newsTile(Article article, BuildContext context) {
  return Card(
    color: Colors.grey[900],
    child: InkWell(
      splashColor: Colors.grey,
      onTap: () async {
        await getContents(article);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetailsPage(article: article)));
      },
      child: TileContents(article: article),
    ),
  );
}

class TileContents extends StatelessWidget {
  final Article article;
  const TileContents({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Settings.getValue('visual-layout', 1) == 2) {
      return ListTile(
        leading: CachedNetworkImage(
          imageUrl: article.multimedia[4].url,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          article.title,
          style: const TextStyle(wordSpacing: 1.0),
        ),
        subtitle: Text(
          article.abstract,
          style: const TextStyle(wordSpacing: 1.0),
        ),
        isThreeLine: true,
      );
    } else if (Settings.getValue('visual-layout', 1) == 1) {
      return Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(12.0),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4.0)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    article.multimedia[0].url,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(article.title, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      );
    }
  }
}

//class TileContents extends StatelessWidget {
//  final Article article;
//  TileContents({Key? key, required this.article}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.all(12.0),
//      margin: const EdgeInsets.all(12.0),
//      decoration: BoxDecoration(
//        color: Colors.grey[800],
//        borderRadius: BorderRadius.circular(10.0),
//        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4.0)],
//      ),
//      child: Column(
//        children: [
//          ClipRRect(
//              borderRadius: BorderRadius.circular(15.0),
//              child: Image.network(article.multimedia[0].url)),
//          const SizedBox(height: 8.0),
//          Text(article.title, style: Theme.of(context).textTheme.subtitle1),
//        ],
//      ),
//    );
//  }
//}
//