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
      "Course Forum",
      "Course Objectives",
      "Course Schedule",
      "Lecturer",
      "Places & Dates",
      "Teaching Assistants",
      "Team Project",
      "Team Project Group",
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
                      for (var i = 0; i < 10; i++)
                        _buildListItem(
                            context, snapshot.data.documents[index], dbList, i),
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

Widget _buildListItem(
    BuildContext context, DocumentSnapshot document, List dbList, int i) {
  if (document[dbList[i]] is String) {
    return ExpandablePanel(
      header: Text(dbList[i]),
      expanded: Column(
        children: <Widget>[
          Text(
            document[dbList[i]],
          ),
        ],
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  } else {
    return ExpandablePanel(
      header: Text(dbList[i]),
      expanded: Column(
        children: <Widget>[
          for (var j = 0; j < document[dbList[i]].length; j++)
            Text(
              document[dbList[i]][j],
            ),
        ],
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }
}
