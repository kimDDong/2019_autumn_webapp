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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CourseObjectives()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Lecturer()));
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TeachingAssistants()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PlacesDates()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CourseForum()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Textbooks()));
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CourseSchedule()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TeamProject()));
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TeamProjectGroup()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Assessments()));
            },
            leading: Icon(Icons.accessibility),
          )),
    ],
  );
}

CourseObjectives() {}

Lecturer() {}

TeachingAssistants() {}

PlacesDates() {}

CourseForum() {}

Textbooks() {}

CourseSchedule() {}

TeamProject() {}

TeamProjectGroup() {}

Assessments() {}
