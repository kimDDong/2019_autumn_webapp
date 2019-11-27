import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      Text("test"),
      Text("test"),
      Text("test"),
      Text("test"),
    ];
    final _kTabs = <Tab>[
      Tab(text: 'Home'),
      Tab(text: 'Event'),
      Tab(text: 'Store'),
      Tab(text: 'My'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SELAB"),
          elevation: 0,
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
