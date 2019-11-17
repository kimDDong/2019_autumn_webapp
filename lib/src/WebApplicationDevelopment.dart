import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

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

    final Set dbSet2 = {
      "lecture",
      "lab"
    };
    final List dbList2 = dbSet2.toList();
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
          body: TabBarView(
              children: <Widget>[
                StreamBuilder(  // This is HOME Tab
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
                StreamBuilder(  // This is HOME Tab
                  stream: Firestore.instance.collection('Web_course_test').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            for (var i = 0; i < 2; i++)
                              _buildListItem2(
                                  context, snapshot.data.documents[0], dbList2[i]),
                          ],
                        );
                      },
                    );
                  },
                ),
              ]
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



Widget _buildListItem2(
    BuildContext context, DocumentSnapshot document, String sentence) {
  String name;
  if(sentence == 'lecture'){
    name = "Lectures";
  }
  else{
    name = "Labs";
  }
  print(sentence);
  List<List<String>> gridState = [["",""]];
  for(var k = 1; k< 3; k++)
      gridState.add([document[sentence][(k-1).toString()]['title'],
                     document[sentence][(k-1).toString()]['link']]);

  //String ds = document['title'];
    return ExpandablePanel(
      header: Text(name),
      expanded: Column(
        children: <Widget>[
          for(var i = 1; i<3; i++)
            ListTile(
            onTap: () {
                _launchURL(gridState[i][1]);
              },
                title : Text(gridState[i][0]),
            ),
          //Text("ddddd"),
        ],
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );

}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

