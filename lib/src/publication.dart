import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';


class Publication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Publications')
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('publications').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
                //itemCount: snapshot.data.documents.length,
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
        )
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
      expanded: Container(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          document['In Proc.'],
          softWrap: true,
          textScaleFactor: 2,
        ),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }
}