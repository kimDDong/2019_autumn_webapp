import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WebApplicationDevelopment.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Undergraduate Course"),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return ListView(
    children: <Widget>[
      Container(
        height: size.height*0.1,
        child: ListTile(
          onTap: (){
          },
          leading: Icon(Icons.accessibility),
          title: Text('Logical Fundamentals of Programming', textScaleFactor: 1.2,),
          subtitle: Text("CSE107"),
        ),
      ),
      Container(
        height: size.height*0.1,
        child: ListTile(
          onTap: (){
          },
          leading: Icon(Icons.airline_seat_flat),
          title: Text('Programming Fundamentals',textScaleFactor: 1.3),
          subtitle: Text("CSE117"),
        ),
      ),
      Container(
        height: size.height*0.1,
        child: ListTile(
          leading: Icon(Icons.web_asset),
          title: Text('Web Programming',textScaleFactor: 1.3),
          subtitle: Text("CSE322"),
        ),
      ),
      Container(
        height: size.height*0.1,
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WebApplicationDevelopment()));
          },
          leading: Icon(Icons.accessible),
          title: Text('Web Application Development',textScaleFactor: 1.3),
          subtitle: Text("CSE326"),
        ),


      ),Container(
        height: size.height*0.1,
        child: ListTile(
          leading: Icon(Icons.build),
          title: Text('Software Engineering',textScaleFactor: 1.3),
          subtitle: Text("CSE406"),
        ),
      ),
    ],
  );

}
_launchURL() async {
  const url = 'https://selab.hanyang.ac.kr/courses/cse326/2019/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}