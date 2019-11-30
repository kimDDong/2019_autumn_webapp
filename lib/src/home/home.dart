import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/src/home/contact.dart';
import 'package:untitled3/src/home/course.dart';
import 'package:untitled3/src/home/labHome.dart';
import 'package:untitled3/src/home/members.dart';
import 'package:untitled3/src/home/gallery.dart';
import 'package:untitled3/src/home/about.dart';
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
//      CoursePage2(),
    ];
    final _kTabs = <Tab>[
      Tab(child: Text("HOME")),
      Tab(
        child: Text("RESEARCH"),
      ),
      Tab(
        child: Text("MEMBERS"),
      ),
      Tab(
        child: Text("GALLERY"),
      ),
      Tab(
        child: Text("PUBLICATION"),
      ),
//      Tab(child: Text("Course"),),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: FlatButton(
              padding: EdgeInsets.all(0),
              child: Container(
                  height: 100, child: Image.asset('images/logo.png')),
          onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contact()));
          },),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.white54,
            labelColor: Colors.white,
            tabs: _kTabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}

