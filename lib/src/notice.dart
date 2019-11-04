import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('notice').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context,DocumentSnapshot document ){
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              document['title'],
            ),
          ),
          Container(
            child: Text(
              document['name'],
            ),
          )
        ],
      ),
      onTap: (){
        print("sss");
      },
    );
  }


}