import 'package:flash_reads/pages/bookmarked_page.dart';
import 'package:flash_reads/pages/home_page.dart';
import 'package:flash_reads/pages/live_news_page.dart';
import 'package:flash_reads/pages/settings_page.dart';
import 'package:flash_reads/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

late SharedPreferences prefs;

void main() => runApp(Phoenix(child: const FlashReads()));

class FlashReads extends StatefulWidget {
  const FlashReads({Key? key}) : super(key: key);
  @override
  _FlashReadsState createState() => _FlashReadsState();
}

class _FlashReadsState extends State<FlashReads> {
  void asyncInits() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      debugPrint("Preferences Loadeed");
    });
  }

  @override
  void initState() {
    super.initState();
    asyncInits();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flash Reads",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: (prefs.getString('theme') == 'light')
          ? lightThemeData(context)
          : darkThemeData(context),
      darkTheme: (prefs.getString('theme') == 'light')
          ? lightThemeData(context)
          : darkThemeData(context),
    );
  }
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    const HomePage(),
    const BookmarkedPage(),
    const LiveNewsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flash Reads"),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(child: Text('News Categories')),
              ),
              ListTile(
                title: Text('Local News'),
                onTap: null,
              ),
              ListTile(
                title: Text('State News'),
                onTap: null,
              ),
              ListTile(
                title: Text('National News'),
                onTap: null,
              ),
              ListTile(
                title: Text('International News'),
                onTap: null,
              ),
              ListTile(
                title: Text('Sports News'),
                onTap: null,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: TabBar(
          tabs: const [
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
          unselectedLabelColor: Colors.grey,
          labelColor: (prefs.getString('theme') == 'dark')
              ? Colors.white
              : Colors.black,
          indicatorColor: (prefs.getString('theme') == 'dark')
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
