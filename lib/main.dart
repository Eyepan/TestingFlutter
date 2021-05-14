import 'package:flash_reads/pages/favourites_page.dart';
import 'package:flash_reads/pages/home_page.dart';
import 'package:flash_reads/pages/live_video.dart';
import 'package:flash_reads/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: 'FlashReads',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.grey[800],
          backgroundColor: Colors.grey[900],
          brightness: Brightness.dark,
          textTheme: const TextTheme(
            headline3: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    FavouritesPage(),
    LiveVideoPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FlashReads"),
          //backgroundColor: Colors.blueGrey,
          elevation: 0.0,
        ),
        //backgroundColor: Theme.of(context).primarySwatch,
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.bookmark),
            ),
            Tab(
                icon: Icon(
              Icons.video_call_sharp,
            )),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
