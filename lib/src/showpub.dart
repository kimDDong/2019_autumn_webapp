import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowPublication extends StatelessWidget {
  const ShowPublication({Key key, this.category}) : super(key: key);
  final category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('$category'),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream : Firestore.instance
            .collection('$category')
            .orderBy('year')
            .snapshots(),
        builder: (context,snapshot){
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  _buildListItem(context, snapshot.data.documents[index]),
                  Divider(
                    height: 10,
                    color: Colors.black45,
                    indent: 10,
                    endIndent: 10,
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
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: ExpandablePanel(
        header: Text(
          document['title'],
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[400]),

        ),
        collapsed: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '\n'+document['writer'],
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
          ),
        ),
        expanded: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                document['writer'],
                softWrap: true,
                textScaleFactor: 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                document['Inproc.'],
                softWrap: true,
                textScaleFactor: 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child : ListTile(
                onTap: (){
                  _launchURL(document['pdf']);
                },
                title: Text('Download the pdf',style : TextStyle(color : Colors.blue)),
              )
            )
          ],
        ),
        tapHeaderToExpand: true,
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