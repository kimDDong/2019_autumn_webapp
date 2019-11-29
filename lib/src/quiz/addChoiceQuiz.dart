import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChoiceQuiz extends StatefulWidget {
  @override
  _ChoiceQuizState createState() => _ChoiceQuizState();
}

class _ChoiceQuizState extends State<ChoiceQuiz> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    controller: _title,
                    decoration: InputDecoration(hintText: 'First Sentence'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Input Sentence.";
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    controller: _description,
                    decoration: InputDecoration(hintText: 'Blank'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Input Blank.";
                      }
                      return null;
                    },
                  ),
                ),

                Padding(

                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(hintText: 'Second Sentence'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Input Sentence.";
                      }
                      return null;
                    },
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.ko);
                    },
                    child: Text(
                      'show date time picker (Chinese)',
                      style: TextStyle(color: Colors.blue),
                    )),

                FlatButton(
                  child: Text("GO!"),
                  color: Colors.blueAccent,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _showDialog(context);
                    }
                  },
                )
              ],
            ),
          ),


        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Well done!"),
          content: Column(
            children: <Widget>[
              Text("Submit Complete!!"),
              Text(
                "DO NOT SUBMIT AGAIN!",
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Colors.blue,
            ),
          ],
        );
      },
    );
  }
}