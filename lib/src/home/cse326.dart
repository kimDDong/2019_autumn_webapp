import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class CSE326 extends StatelessWidget {
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

    final Set dbSet2 = {"lecture", "lab"};
    final List dbList2 = dbSet2.toList();
    final _kTabPages = <Widget>[
      Card(
        child: Image.asset('images/picture.png'),
        margin: EdgeInsets.all(10),
        color: Colors.black12,
      ),
      StreamBuilder(
        // This is HOME Tab
        stream:
            Firestore.instance.collection('Web_course_test').snapshots(),
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
      )
    ];
    final _kTabs = <Tab>[
      Tab(child: Text("HOME")),
      Tab(child: Text("SLIDE")),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height: 100, child: Image.asset('images/logo.png')),
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
  if (sentence == 'lecture') {
    name = "Lectures";
    List<List<String>> gridState = [
      ["", ""]
    ];
    for (var k = 1; k < 16; k++)
      gridState.add([
        document[sentence][(k - 1).toString()]['title'],
        document[sentence][(k - 1).toString()]['link']
      ]);

    //String ds = document['title'];
    return Container(
      margin : EdgeInsets.only(top : 20),
      padding : EdgeInsets.only(right : 10),
      child:
      ExpandablePanel(
      header: Container(
        alignment: Alignment.centerLeft,
        padding : EdgeInsets.only(left : 25, top : 5),
//        alignment: Alignment.,
        child: Text(name, textAlign: TextAlign.start ,style: TextStyle(
          fontSize: 30,
        ),),
      ),
      expanded: Column(
        children: <Widget>[
          for (var i = 1; i < 16; i++)
            Container(
              margin : EdgeInsets.only(left : 20),
              child:
            ListTile(
                onTap: () {
                  _launchURL(gridState[i][1]);
                },
                title: Row(
                  children: <Widget>[
                    Container(
                      margin : EdgeInsets.only(right : 10),
                      alignment: Alignment.center,
                      width: 29,
                      height: 29,
//                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        (i - 1).toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(gridState[i][0],textScaleFactor: 0.9,),
                  ],
//              mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
                )),
            )

          //Text("ddddd"),
        ],
      ),
      tapHeaderToExpand: true,
      hasIcon: true,

          ),
    );
  } else {
    name = "Labs";
    List<List<String>> gridState = [
      ["", ""]
    ];
    for (var k = 1; k < 12; k++)
      gridState.add([
        document[sentence][(k - 1).toString()]['title'],
        document[sentence][(k - 1).toString()]['link']
      ]);

    //String ds = document['title'];
    return Container(
      margin : EdgeInsets.only(top : 20),
      padding : EdgeInsets.only(right : 10),
      child:
      ExpandablePanel(
        header: Container(
          alignment: Alignment.centerLeft,
          padding : EdgeInsets.only(left : 25, top : 5),
//        alignment: Alignment.,
          child: Text(name, textAlign: TextAlign.start ,style: TextStyle(
            fontSize: 30,
          ),),
        ),
        expanded: Column(
          children: <Widget>[
            for (var i = 1; i < 12; i++)
              Container(
                margin : EdgeInsets.only(left : 20),
                child:
                ListTile(
                    onTap: () {
                      _launchURL(gridState[i][1]);
                    },
                    title: Row(
                      children: <Widget>[
                        Container(
                          margin : EdgeInsets.only(right : 10),
                          alignment: Alignment.center,
                          width: 29,
                          height: 29,
//                      margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            (i - 1).toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(gridState[i][0],textScaleFactor: 0.9,),
                      ],
//              mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
                    )),
              )

            //Text("ddddd"),
          ],
        ),
        tapHeaderToExpand: true,
        hasIcon: true,

      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
