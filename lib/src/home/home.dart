import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/src/home/labHome.dart';
import 'package:untitled3/src/home/members.dart';
import 'package:untitled3/src/etc/gallery.dart';
import 'package:untitled3/src/etc/about.dart';
import 'package:untitled3/src/home/publication.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      LabHome(),
      About(),
      Members(),
      Gallery(),
      Publication(),
    ];
    final _kTabs = <Tab>[
      Tab(child: Text("Home",textScaleFactor: 0.8,)),
      Tab(child: Text("Research",textScaleFactor: 0.8,),),
      Tab(child: Text("Members",textScaleFactor: 0.8,),),
      Tab(child: Text("Gallery",textScaleFactor: 0.8,),),
      Tab(child: Text("Publication",textScaleFactor: 0.7,),),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height:100,child: Image.asset('images/logo.png')),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.white54,
            labelColor: Colors.white,
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
