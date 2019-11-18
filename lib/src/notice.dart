import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/islogin.dart';

import 'addnotice.dart';



class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        actions: <Widget>[
          counter.getCounter()==0?
          Container():IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddNotice()));
            },
          )
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
                  _buildListItem(context, snapshot.data.documents[index]),
                  Divider(
                    height: 10,
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
    final String date = document['date'].toDate().toString();
    final db = Firestore.instance;
    return ExpandablePanel(
      header: Text(
        document['title'],
        textScaleFactor: 1.5,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      collapsed: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date.split(" ")[0],
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
        ),
      ),
      expanded: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              document['description'],
              softWrap: true,
              textScaleFactor: 2,
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
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    iconSize: 40,
                    onPressed: () {
                      _showDialog(context, db, document);
                    },
                  )
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
