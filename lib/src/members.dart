import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';

import 'addnotice.dart';

class Members extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title : Text("Members")),
      body:

      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('members').orderBy('number', descending: false).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error : ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  itemExtent: 80,
                  children: snapshot.data.documents.map((document) => makeRowItem(context, document)).toList(),
                );
            }
          }
      ),
    );
  }

  Widget makeRowItem(BuildContext ctx, DocumentSnapshot document) {
    return Center(child: Container(
      color: Colors.lightBlue[1],
      child: ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  document['name'],
                  style: TextStyle(fontSize: 19, color: Colors.orange[300])),
            ),
            Container(
              child: Text(
                  document['position'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[500])),
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(ctx,
              MaterialPageRoute<void>(builder: (BuildContext context) => Detail(document : document))
          );
        },
      ),
    ),
    );
  }
}


class Detail extends StatelessWidget {
  Detail({Key key, this.document}) : super(key: key);
  final DocumentSnapshot document;


  @override
  Widget build(BuildContext context) {
    String str = "none";
    String str2 = "none";

    if(document['research'] == "none"){
      str = "Career";
      str2 = document['career'];
    }
    else{
      str = "Research Interests";
      str2 = document['research'];
    }

    return Scaffold(
      appBar: AppBar(title: Text(document['name'])),
      body: SingleChildScrollView( // 없으면, 화면을 벗어났을 때 볼 수 없음 (스크롤 지원)
        child: Column(
          children: <Widget>[
            Card(
              child : Image.network(document['image'], width : 300, height :240, fit:BoxFit.contain),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            make_title("Position"),
            make_content((document['position'])),
            make_title("E-mail"),
            make_content((document['email'])),
            make_title("Connect Link"),
            make_content((document['site'])),
            make_title("Detail"),
            make_content((document['detail'])),
            make_title(str),
            make_content(str2),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }


  Widget make_title(String tit){
    var container = Container(
      child: Text(
        tit,
        style: TextStyle(fontSize: 15.0, color: Colors.orange[300]),
      ),
      padding: EdgeInsets.only(left : 20, top : 20, bottom : 15),
//        textAlign : Left;
//        width : 150,
    );
    return container;
  }

  Widget make_content(String con){
    var container = Container(
      child: Text(
        con,
        style: TextStyle(fontSize: 25.0, color: Colors.grey[500]),
      ),
      padding: EdgeInsets.only(left : 25,bottom : 20, right : 25),
//      width : 400,
    );
    return container;
  }
}
