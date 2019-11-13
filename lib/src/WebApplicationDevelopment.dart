import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/src/course.dart';

class WebApplicationDevelopment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Set dbSet = {
      "Assessments",
      "Course Objectives",
      "Course Schedule",
      "Lecturer",
      "Places & Dates",
      "Teaching Assistants",
      "Textbooks",
      "name"
    };
    final List dbList = dbSet.toList();
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
          body: StreamBuilder(
            stream: Firestore.instance.collection('courses').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      _buildListItem(context, snapshot.data.documents[index]),
                      Divider(
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

//        Container(
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Text(
//                    'By ' + document['name'],
//                    textScaleFactor: 1.5,
//                    style: TextStyle(fontStyle: FontStyle.italic),
//                  ),
//                ),
////                IconButton(
////                  icon: Icon(Icons.delete_forever),
////                  iconSize: 40,
////                  onPressed: () {
////                    _showDialog(context, db, document);
////                  },
////                )
//              ],
//            ))
//final String date = document['date'].toDate().toString();
//final db = Firestore.instance;
//    collapsed: Align(
//      alignment: Alignment.centerLeft,
//      child: Text(
//        date.split(" ")[0],
//        softWrap: true,
//        maxLines: 2,
//        overflow: TextOverflow.ellipsis,
//        textDirection: TextDirection.ltr,
//      ),
//    ),
Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return ExpandablePanel(
    header: Text("Course Schedule"),
    expanded: Column(
      children: <Widget>[
        for (var j = 0; j < document['Course Schedule'].length; j++)
          Text(
            document['Course Schedule'][j],
          ),
      ],
    ),
    tapHeaderToExpand: true,
    hasIcon: true,
  );
}
//Widget _buildListItemCourseObjectives(BuildContext context, DocumentSnapshot document) {
//  return ExpandablePanel(
//    header: Text(
//      "CourseObjectives",
//      textScaleFactor: 1.5,
//      style: TextStyle(fontWeight: FontWeight.bold),
//    ),
//    expanded: Column(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.all(15),
//          child:
////          child: Text(
////            document['CourseObjectives'],
////            softWrap: true,
////            textScaleFactor: 2,
////          ),
//        ),
//      ],
//    ),
//    tapHeaderToExpand: true,
//    hasIcon: true,
//  );
//}

//class BodyLayout extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return _ListView(context);
//  }
//}
//
//Widget _ListView(BuildContext context) {
//  final Size size = MediaQuery.of(context).size;
//  return ListView(
//    children: <Widget>[
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Course Objectives",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => CourseObjectives()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Lecturer",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => Lecturer()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Teaching Assistants",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => TeachingAssistants()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Places & Dates",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => PlacesDates()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Course Forum",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => CourseForum()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Textbooks",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => Textbooks()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Course Schedule",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => CourseSchedule()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Team Project",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => TeamProject()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Team Project Group",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => TeamProjectGroup()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//      Container(
//          height: size.height * 0.1,
//          child: ListTile(
//            title: Text(
//              "Assessments",
//              textScaleFactor: 1.2,
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute<void>(
//                      builder: (BuildContext context) => Assessments()));
//            },
//            leading: Icon(Icons.accessibility),
//          )),
//    ],
//  );
//}
//
//class CourseObjectives extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("CourseObjectives"),
//    ));
//  }
//}
//
//class Lecturer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Lecturer"),
//      ),
//      body: Text("Scott"),
//    );
//  }
//}
//
//class TeachingAssistants extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("TeachingAssistants"),
//    ));
//  }
//}
//
//class PlacesDates extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("PlacesDates"),
//    ));
//  }
//}
//
//class CourseForum extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("CourseForum"),
//    ));
//  }
//}
//
//class Textbooks extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("Textbooks"),
//    ));
//  }
//}
//
//class CourseSchedule extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("CourseSchedule"),
//    ));
//  }
//}
//
//class TeamProject extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("TeamProject"),
//    ));
//  }
//}
//
//class TeamProjectGroup extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("TeamProjectGroup"),
//    ));
//  }
//}
//
//class Assessments extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(
//      title: Text("Assessments"),
//    ));
//  }
//}
