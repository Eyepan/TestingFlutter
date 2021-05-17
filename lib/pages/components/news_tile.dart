import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_reads/constants.dart';
import 'package:flash_reads/models/article_class.dart';
import 'package:flash_reads/pages/article_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_reads/main.dart';

Widget newsTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () async {
      await getContents(article);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetailsPage(article: article)));
    },
    child: TileContents(article: article),
  );
}

class TileContents extends StatefulWidget {
  final Article article;
  const TileContents({Key? key, required this.article}) : super(key: key);

  @override
  State<TileContents> createState() => _TileContentsState();
}

class _TileContentsState extends State<TileContents> {
  @override
  Widget build(BuildContext context) {
    if (prefs.getString('visual-layout-type') == 'card') {
      return CardsLayout(article: widget.article);
    } else if (prefs.getString('visual-layout-type') == 'compact') {
      return CompactLayout(article: widget.article);
    } else {
      prefs.setString('visual-layout-type', 'card');
      return CardsLayout(article: widget.article);
    }
  }
}

class CardsLayout extends StatelessWidget {
  final Article article;
  const CardsLayout({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: article.multimedia[0].url,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    LinearProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const Divider(),
          Text(article.title, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}

class CompactLayout extends StatelessWidget {
  final Article article;
  const CompactLayout({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: article.multimedia[2].url,
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
  }
}
