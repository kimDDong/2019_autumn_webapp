import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Research extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title : Text("Research")),
      body:
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('research').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error : ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  itemExtent: 80,
                  children: snapshot.data.documents.map((document) => make_Row(context, document)).toList(),
                );
            }
          }
      ),
    );
  }

  Widget make_Row(BuildContext ctx, DocumentSnapshot document) {
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

    return Scaffold(
      appBar: AppBar(title: Text(document['name'])),
      body: SingleChildScrollView( // 없으면, 화면을 벗어났을 때 볼 수 없음 (스크롤 지원)
        child: Column(
          children: <Widget>[
            make_title("Name"),
            make_content((document['name'])),
            make_title("Details"),
            make_content((document['detail1'])),
            make_content((document['detail2'])),
            make_content((document['detail3'])),

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