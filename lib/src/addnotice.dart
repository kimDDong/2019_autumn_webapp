import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notice.dart';

class AddNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notice'),
      ),
      body: AddNoticeForm(),
    );
  }
}

class AddNoticeForm extends StatefulWidget {
  @override
  AddNoticeFormState createState() {
    return AddNoticeFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddNoticeFormState extends State<AddNoticeForm> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _title,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _description,
              decoration: InputDecoration(hintText: 'Enter Description'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(hintText: 'Enter Your Name'),
            ),
          ),
          FlatButton(
            child: Text("Post"),
            color: Colors.blueAccent,
            onPressed: () {
              db.collection('notice').add({
                'title': _title.text,
                'description': _description.text,
                'name': _name.text,
                'date': Timestamp.now()
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
