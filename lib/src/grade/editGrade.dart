import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';


class EditGrade extends StatefulWidget{
  DocumentSnapshot document;
  EditGrade(DocumentSnapshot document){
    this.document = document;
  }

  @override
  _EditGradeState createState() => _EditGradeState(document);
}

class _EditGradeState extends State<EditGrade> {
  DocumentSnapshot document;
  _EditGradeState(DocumentSnapshot document){
    this.document = document;
  }
  TextEditingController _absent = TextEditingController();
  TextEditingController _quiz = TextEditingController();
  TextEditingController _midterm = TextEditingController();
  TextEditingController _final = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){
              showPickerNumber(context);
            },
            child: Text("asd"),
          )
        ],
      )
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text("Are you sure to add it?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async {
//                await Firestore.instance.collection('quiz').add({
//                  'question': _first.text + "\\blank\\" + _second.text,
//                  'answer': _blank.text,
//                  'description': _blank.text,
//                  'type': "blank",
//                  'startTime': startTime,
//                  'endTime': endTime
//                });

//                Navigator.of(context)
//                    .popUntil(MaterialPageRoute(builder: (context) => Notice()));
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
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
  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 0, end: 16)
        ]),
        hideHeader: true,
        title: Center(child: new Text("Absent")),

        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }
}