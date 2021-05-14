import 'package:flash_reads/utils/article_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArticleDetailsPage extends StatefulWidget {
  final Article article;

  // ignore: use_key_in_widget_constructors
  const ArticleDetailsPage({this.article});

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  final ScrollController _scrollController = ScrollController();

  bool _showFloatingButton = true;

  @override
  void initState() {
    super.initState();
    handleScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloatingActionButton() {
    setState(() {
      _showFloatingButton = true;
    });
  }

  void hideFloatingActionButton() {
    setState(() {
      _showFloatingButton = false;
    });
  }

  void handleScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloatingActionButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloatingActionButton();
      }
    });
  }

  List<Widget> listofParagraphs = [];

  @override
  Widget build(BuildContext context) {
    for (String paragraph in widget.article.contents) {
      //for (int i = 0; i < widget.article.contents.length; i++) {
      listofParagraphs.add(Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          paragraph,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.white70),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title)),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.article.multimedia[0].url),
              const SizedBox(height: 8.0),
              Text(
                widget.article.title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.article.abstract,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white70),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: listofParagraphs)
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _showFloatingButton,
        child: FloatingActionButton(
          onPressed: () {
            launch(widget.article.url);
          },
          child: const Icon(Icons.open_in_browser),
        ),
      ),
    );
  }
}
