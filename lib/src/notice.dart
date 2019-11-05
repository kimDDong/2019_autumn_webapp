import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';

class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => addNotice()));
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
              });
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    final String date = document['date'].toDate().toString();

    print(document['date']);
    return ExpandablePanel(
      header: Text(
        document['title'],
        textScaleFactor: 1.5,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      collapsed:
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date.split(" ")[0],
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
        ),
      ),
      expanded: Container(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          document['description'],
          softWrap: true,
          textScaleFactor: 2,
        ),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }

  Widget addNotice() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notice'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
