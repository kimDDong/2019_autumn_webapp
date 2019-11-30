import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChoiceQuiz extends StatefulWidget {
  @override
  _ChoiceQuizState createState() => _ChoiceQuizState();
}

class _ChoiceQuizState extends State<ChoiceQuiz> {
  TextEditingController _question = TextEditingController();
  TextEditingController _choice1 = TextEditingController();
  TextEditingController _choice2 = TextEditingController();
  TextEditingController _choice3 = TextEditingController();
  TextEditingController _choice4 = TextEditingController();
  TextEditingController _choice0 = TextEditingController();
  int _radioValue;
  int _answer = 0;
  final _formKey = GlobalKey<FormState>();
  String startTimeString = "Start Time";
  String endTimeString = "End Time";
  DateTime startTime = DateTime.now();
  DateTime endTime = new DateTime(
      DateTime
          .now()
          .year, DateTime
      .now()
      .month, DateTime
      .now()
      .day + 1);
  List choices = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.orange),
                          fillColor: Colors.orange,
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: Colors.orange),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: Colors.orange),
                          ),
                          hintText: 'Question'),
                      controller: _question,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Fill Question.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: TextFormField(

                          controller: _choice0,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: Colors.orange),
                              fillColor: Colors.orange,
                              focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.orange),
                              ),
                              hintText: 'Choice 1'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Fill Choice.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: TextFormField(

                          controller: _choice1,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: Colors.orange),
                              fillColor: Colors.orange,
                              focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.orange),
                              ),
                              hintText: 'Choice 2'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Fill Choice.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: TextFormField(

                          controller: _choice2,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: Colors.orange),
                              fillColor: Colors.orange,
                              focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.orange),
                              ),
                              hintText: 'Choice 3'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Fill Choice.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 3,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: TextFormField(

                          controller: _choice3,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: Colors.orange),
                              fillColor: Colors.orange,
                              focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.orange),
                              ),
                              hintText: 'Choice 4'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Fill Choice.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 4,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: TextFormField(

                          controller: _choice4,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: Colors.orange),
                              fillColor: Colors.orange,
                              focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.orange),
                              ),
                              hintText: 'Choice 5'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Fill Choice.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            setState(() {
                              startTime = date;
                              startTimeString =
                                  startTime.toString().split(':')[0] +
                                      ":" +
                                      startTime.toString().split(':')[1];
                            });

                            print('confirm $date');
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.ko);
                    },
                    child: Text(
                      startTimeString,
                      style: TextStyle(color: Colors.orangeAccent),
                    )),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            setState(() {
                              endTime = date;
                              endTimeString = endTime.toString().split(':')[0] +
                                  ":" +
                                  endTime.toString().split(':')[1];
                            });

                            print('confirm $date');
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.ko);
                    },
                    child: Text(
                      endTimeString,
                      style: TextStyle(color: Colors.orangeAccent),
                    )),
              ),
            ],
          ),
          Container(

            margin: EdgeInsets.all(10),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
              child: Text("GO!"),
              color: Colors.orangeAccent,
              onPressed: () async {
                choices.add(_choice0.text);
                choices.add(_choice1.text);
                choices.add(_choice2.text);
                choices.add(_choice3.text);
                choices.add(_choice4.text);


                if (_formKey.currentState.validate()) {
                  _showDialog(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });

    switch (_radioValue) {
      case 0:
        _answer = 0;
        break;
      case 1:
        _answer = 1;
        break;
      case 2:
        _answer = 2;
        break;
      case 3:
        _answer = 3;
        break;
      case 4:
        _answer = 4;
        break;
    }
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
                await Firestore.instance.collection('quiz').add({
                  'question': _question.text,
                  'answer': _answer,
                  'answers': choices,
                  'type': "choice",
                  'startTime': startTime,
                  'endTime': endTime
                });

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
}
