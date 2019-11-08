import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/src/course.dart';

class WebApplicationDevelopment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "HOME",
                ),
                Tab(
                  text: "SLIDE",
                ),
              ],
            ),
            title: Text('Web Application Development'),
          ),
          body: BodyLayout(),
        ),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ListView(context);
  }
}

Widget _ListView(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return ListView(
    children: <Widget>[
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Course Objectives",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => CourseObjectives()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Lecturer",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Lecturer()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Teaching Assistants",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => TeachingAssistants()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Places & Dates",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => PlacesDates()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Course Forum",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => CourseForum()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Textbooks",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Textbooks()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Course Schedule",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => CourseSchedule()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Team Project",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => TeamProject()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Team Project Group",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => TeamProjectGroup()));
            },
            leading: Icon(Icons.accessibility),
          )),
      Container(
          height: size.height * 0.1,
          child: ListTile(
            title: Text(
              "Assessments",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Assessments()));
            },
            leading: Icon(Icons.accessibility),
          )),
    ],
  );
}

class CourseObjectives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("CourseObjectives"),
    ));
  }
}

class Lecturer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecturer"),
      ),
      body: Text("Scott"),
    );
  }
}

class TeachingAssistants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("TeachingAssistants"),
    ));
  }
}

class PlacesDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("PlacesDates"),
    ));
  }
}

class CourseForum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("CourseForum"),
    ));
  }
}

class Textbooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("Textbooks"),
    ));
  }
}

class CourseSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("CourseSchedule"),
    ));
  }
}

class TeamProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("TeamProject"),
    ));
  }
}

class TeamProjectGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("TeamProjectGroup"),
    ));
  }
}

class Assessments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text("Assessments"),
    ));
  }
}
