import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';


class Publication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publications'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('publications')
            .orderBy('category', descending: true)
            .snapshots(),
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
    return ExpandablePanel(
      header: Text(
        document['title'],
        textScaleFactor: 1.5,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      collapsed: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          document['writer'],
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
              document['In Proc.'],
              softWrap: true,
              textScaleFactor: 1.5,
            ),
          ),
          Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      document['pdf'].toString(),
                      textScaleFactor: 1.5,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ))
        ],
      ),
      tapHeaderToExpand: true,
    );
  }
}
