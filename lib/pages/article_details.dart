import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_reads/utils/article_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsPage extends StatefulWidget {
  final Article article;
  // ignore: use_key_in_widget_constructors
  const ArticleDetailsPage({this.article});

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  List<Widget> listofParagraphs = [];

  @override
  Widget build(BuildContext context) {
    for (String paragraph in widget.article.contents) {
      listofParagraphs.add(
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            paragraph,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white70),
          ),
        ),
      );
    }

    List<String> popupMenuList = ["Open in browser"];
    void popupMenuActions(String choice) {
      if (choice == popupMenuList[0]) {
        launch(widget.article.url);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuActions,
            itemBuilder: (context) => popupMenuList
                .map(
                  (choice) => PopupMenuItem(
                    value: choice,
                    child: Text(choice),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.article.multimedia[0].url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                              value: downloadProgress.progress),
                          const SizedBox(height: 5.0),
                          Text("Loading image...",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: Colors.white60))
                        ],
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(widget.article.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white)),
                const SizedBox(height: 8.0),
                Text(widget.article.abstract,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white60)),
              ] +
              listofParagraphs,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(
            """${widget.article.title}
${widget.article.shortUrl}
Created from FlashReads""",
          );
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

