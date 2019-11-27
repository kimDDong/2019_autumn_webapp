import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/src/members.dart';
import 'package:untitled3/src/gallery.dart';
import 'package:untitled3/src/about.dart';
import 'package:untitled3/src/publication.dart';


import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Text("main"),
      About(),
      Gallery(),
      Publication(),
    ];
    final _kTabs = <Tab>[
      Tab(text: 'Home'),
      Tab(text: 'About'),
      Tab(text: 'Galery'),
      Tab(text: 'Publication'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SELAB"),
          elevation: 0,
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
