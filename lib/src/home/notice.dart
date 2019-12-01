import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/signInOut/islogin.dart';

import 'addnotice.dart';



class Notice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height:100,child: Image.asset('images/logo.png')),
        actions: <Widget>[
          counter.getCounter()==2?
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddNotice()));
            },
          ):Text('')
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('notice')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                      child: _buildListItem(context, snapshot.data.documents[index])),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                    color: Colors.white,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    final counter = Provider.of<Counter>(context);

    final String date = document['date'].toDate().toString();
    final db = Firestore.instance;
    return ExpandablePanel(
      header: Text(
        document['title'],
        textScaleFactor: 1.5,
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orangeAccent),
      ),
      collapsed: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date.split(" ")[0],
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
      expanded: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              document['description'].replaceAll('  ','\n'),
              softWrap: true,
              textScaleFactor: 1.2,
            ),
          ),
          Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'By ' + document['name'],
                      textScaleFactor: 1.5,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  counter.getCounter()!=0?
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    iconSize: 40,
                    onPressed: () {
                      _showDialog(context, db, document);
                    }
                  ):Container()
                ],
              ))
        ],
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }

  void _showDialog(BuildContext context, Firestore db, DocumentSnapshot document) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text("Are you sure you want to delete it?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async{
                await db
                    .collection('notice')
                    .document(document.documentID)
                    .delete();
                Navigator.of(context).pop();
              },
              textColor: Colors.blue,
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Colors.red,
            ),
          ],
        );
      },
    );
  }


}
