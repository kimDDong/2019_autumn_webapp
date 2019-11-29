import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';

import 'addnotice.dart';

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('members')
              .orderBy('number', descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error : ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  itemExtent: 90,
                  children: snapshot.data.documents
                      .map((document) => makeRowItem(context, document))
                      .toList(),
                );
            }
          }),
    );
  }

  Widget makeRowItem(BuildContext ctx, DocumentSnapshot document) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          margin: EdgeInsets.only(left: 10,right: 10,top: 7.5,bottom: 7.5),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(document['image']),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            title: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1.0, color: Colors.grey[400]),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(document['name'],
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 19, color: Colors.black)),
                  ),
                  Container(
                    child: Text(document['position'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            onTap: () {
              Navigator.push(
                  ctx,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          Detail(document: document)));
            },
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

    if (document['research'] == "none") {
      str = "Career";
      str2 = document['career'];
    } else {
      str = "Research Interests";
      str2 = document['research'];
    }

    return Scaffold(
      appBar: AppBar(title: Text(document['name'])),
      body: SingleChildScrollView(
        // 없으면, 화면을 벗어났을 때 볼 수 없음 (스크롤 지원)
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top : 30),
                width: 120,
                height: 120,
//                decoration: BoxDecoration(
//                  border: Border.all(),
//                )
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(document['image']),
                  backgroundColor: Colors.transparent,
                )
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),

            Container(child:
              Column(children: <Widget>[
                Container(child:
                  Text(document['name'], style: TextStyle(
                    fontSize: 20,
                  ),),
                  margin: EdgeInsets.only(top : 10)
                  ,),
                Container(child:
                Text(document['position']),),
              ],),),

            make_title("E-mail"),
            make_content((document['email'])),
            make_title("Connect Link"),
            make_content((document['site'])),
            make_title("Detail"),
            make_content((document['detail'])),
            make_title(str),
            make_content(str2.replaceAll("\\nl", "\n")),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  Widget make_title(String tit) {
    var container = Container(
      child: Text(
        tit,
        style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Raleway-Black',
            fontWeight: FontWeight.bold,
        ),

      ),
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
//        textAlign : Left;
//        width : 150,
    );
    return container;
  }

  Widget make_content(String con) {
    var container = Container(
      child: Text(
        con,
        style: TextStyle(
            fontSize: 19.0,
            color: Colors.grey[500],
            fontFamily: 'Raleway-ExtraBold',
        ),
      ),
      padding: EdgeInsets.only(left: 20, bottom: 20, right: 25),
//      width : 400,
    );
    return container;
  }
}

