import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Choice {
  Choice(this.text, this.icon);

  final String text;
  final IconData icon;
}

class Gallery extends StatelessWidget {
  final choices = [
    Choice('All', Icons.check_box_outline_blank),
    Choice('Social Activity',   Icons.public),
    Choice('Conference',  Icons.business_center),
    Choice('ETC',  Icons.more_horiz),
//    Choice('Conference',  Icons.business_center),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: TabBar(
            tabs: choices.map((Choice choice) {
              return Tab(
                text: choice.text,
                icon: Icon(choice.icon),
              );
            }).toList(),
            isScrollable: false,
          ),
        body: TabBarView(
          children: choices.map((Choice choice) {
            return ChoiceCard(
              text: choice.text,
              icon: choice.icon,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {

  const ChoiceCard({Key key, this.text, this.icon}) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    String select;

    if(text == "ETC" || text == "Social Activity" || text == "Conference"){
      if(text == "ETC"){
        select = "etc";
      }
      else if(text == "Social Activity"){
        select = "social";
      }
      else{
        select = "conference";
      }

      return Scaffold(
        body : StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Gallery').where('category', isEqualTo: select).orderBy('number', descending: true).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error : ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return ListView(
                    //itemExtent: 300,
                    children: snapshot.data.documents.map((document) => makeRowItem(context, document, text)).toList(),
                  );
              }
            },

        ),
      );
    }
    else{
      return Scaffold(
        body : StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Gallery').orderBy('number', descending: true).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error : ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return ListView(
                    //itemExtent: 300,
                    children: snapshot.data.documents.map((document) => makeRowItem(context, document, text)).toList(),
                  );
              }

            }

        ),

      );

    }
  }

  Widget makeRowItem(BuildContext ctx, DocumentSnapshot document, String choice) {
    return Center(child: Container(
      color: Colors.lightBlue[1],
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              child :Column(
                  children: <Widget>[
                  Text(
                  document['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[500])),

                  Card(
                    child : Image.network(document['image'], width : 300, height :240),
                    margin: EdgeInsets.all(10),
                    color: Colors.black12,
                  ),
                  ],
                //crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
        ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    ),
    ),
    );
  }
}