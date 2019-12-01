import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/quiz/addQuiz.dart';
import 'package:untitled3/src/quiz/leaderBoard.dart';
import 'package:untitled3/src/signInOut/authentication.dart';
import 'package:untitled3/src/signInOut/islogin.dart';
import 'package:untitled3/src/signInOut/root_page.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _formKey = GlobalKey<FormState>();
  bool isSubmit = false;
  int _selectNum;
  int _radioValue;
  Timer _everySecond;
  DateTime now;

  @override
  void initState() {
    super.initState();

    // sets first value
    now = DateTime.now();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _everySecond.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    if (counter.getCounter() >= 1) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height: 100, child: Image.asset('images/logo.png')),
          elevation: 0,
          actions: <Widget>[
            counter.getCounter() == 2
                ? IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AddQuiz()));
                    },
                  )
                : Text('')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LeaderBoard()));
          },
          backgroundColor: Colors.white30,
          child: Icon(
            Icons.school,
            color: Colors.white,
          ),
        ),
        body: getQuiz(),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Image.asset('images/logo.png'),
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(18))),
            FlatButton(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGN ",
                    textScaleFactor: 3,
                  ),
                  Text(
                    "IN",
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RootPage(auth: new Auth())));
              },
            ),
          ],
        ),
//        child: Column(
//          children: <Widget>[
//            Container(
//                alignment: Alignment.center,
//                width: 300.0,
//                height: 300.0,
//                child: Image.asset('images/logo.png'),
//                decoration: new BoxDecoration(
//                )),
//            RaisedButton(
//              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
//              color: Colors.amberAccent,
//              child: Text(
//                "Login",
//                textScaleFactor: 3,
//              ),
//              onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) => RootPage(auth: new Auth())));
//              },
//            ),
//          ],
//        ),
      );
    }
  }

  Widget getQuiz() {
    DateTime today = new DateTime(now.year, now.month, now.day);

    return StreamBuilder(
      stream: Firestore.instance
          .collection('quiz')
          .where('startTime', isGreaterThanOrEqualTo: today)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data.documents.isEmpty)
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Quiz isn't ready....")),
              ],
            ));
          else {
            if (snapshot.data.documents[0]['startTime']
                    .toDate()
                    .isBefore(now) &&
                snapshot.data.documents[0]['endTime'].toDate().isAfter(now)) {
              if (snapshot.data.documents[0]['type'] == "blank") {
                return blankQBuild(snapshot.data.documents[0]);
              }
              return buildQChoice(snapshot.data.documents[0]);
            }
            if (snapshot.data.documents[0]['endTime'].toDate().isBefore(now)) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Today Quiz is over",
                      textScaleFactor: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Winner is "),
                        Text(
                          snapshot.data.documents[0]['answerer'][0],
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return quizStartTimer(snapshot.data.documents[0]);
          }
        }
      },
    );
  }

  Widget blankQBuild(DocumentSnapshot document) {
    var questions =
        document['question'].replaceAll("\\n", "\n").split("\\blank\\");
    List<Widget> list = new List<Widget>();
    list.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        "QUESTION!",
        style: TextStyle(
            color: Colors.orange,
            fontSize: MediaQuery.of(context).size.height * 0.04,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    ));
    for (var i = 0; i < questions.length * 2 - 1; i++) {
      if (i % 2 == 0) {
        list.add(Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: new Text(
              questions[i ~/ 2],
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.bold),
            )));
      } else {
        list.add(
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Form(
              key: _formKey,
              child: new TextFormField(
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
                ),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03),
                validator: (String value) {
                  if (value != document['answer']) {
                    return "Wrong!";
                  }
                  return null;
                },
              ),
            ),
          ),
        );
      }
    }
    List answerer = new List();

    list.add(Container(
        margin: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: isSubmit
              ? null
              : () async {
                  if (_formKey.currentState.validate()) {
                    answerer.add("$email3");
                    await Firestore.instance
                        .collection('quiz')
                        .document(document.documentID)
                        .updateData(
                            {"answerer": FieldValue.arrayUnion(answerer)});
                    _showDialog(context);

                    setState(() {
                      isSubmit = true;
                    });
                  }
                },
//          onPressed: isSubmit
//              ? null
//              : () async {
//            if (!isSubmit && _selectNum == document['answer']) {
//              answerer.add('$email3');
//              await Firestore.instance
//                  .collection('quiz')
//                  .document(document.documentID)
//                  .updateData(
//                  {"answerer": FieldValue.arrayUnion(answerer)});
//              _showDialog(context);
//            }
//
//            setState(() {
//              isSubmit = true;
//            });
//          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Submit",
                textScaleFactor: 2,
                style: TextStyle(color: Colors.white),
              ),
              quizEndTime(document)
            ],
          ),
          color: Colors.orange,
        )));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
        ),
      ],
    );
  }

  Widget buildQChoice(DocumentSnapshot document) {
    List<Widget> list = new List<Widget>();
    List<String> shuffleList = new List<String>();
    list.add(Text(
      "QUESTION!",
      style: TextStyle(
          color: Colors.orange,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.04),
    ));
    list.add(Text(
      "\t\t" + document['question'],
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.03),
    ));

    for (int i = 0; i < document['answers'].length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(left: 30),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 20,
              height: 20,
              child: Center(
                  child: Text(
                (i + 1).toString(),
                style: TextStyle(color: Colors.white),
              )),
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(document['answers'][i]))),
            new Radio(
              value: i,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
          ],
        ),
      ));
    }

    List answerer = new List();

    list.add(Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: isSubmit
              ? null
              : () async {
                  if (!isSubmit && _selectNum == document['answer']) {
                    answerer.add('$email3');
                    await Firestore.instance
                        .collection('quiz')
                        .document(document.documentID)
                        .updateData(
                            {"answerer": FieldValue.arrayUnion(answerer)});
                    _showDialog(context);
                  }

                  setState(() {
                    isSubmit = true;
                  });
                },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Submit",
                textScaleFactor: 2,
                style: TextStyle(color: Colors.white),
              ),
              quizEndTime(document)
            ],
          ),
          color: isSubmit ? Colors.black12 : Colors.orange,
        )));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
        ),
      ],
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });

    switch (_radioValue) {
      case 0:
        _selectNum = 0;
        break;
      case 1:
        _selectNum = 1;
        break;
      case 2:
        _selectNum = 2;
        break;
      case 3:
        _selectNum = 3;
        break;
      case 4:
        _selectNum = 4;
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

  Widget quizStartTimer(DocumentSnapshot document) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "START IN",
            textScaleFactor: 4,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.timer,
            size: MediaQuery.of(context).size.width * 0.5,
            color: Colors.orangeAccent,
          ),
//          Text(document['startTime'].toDate().toString()),
//          Text(now.toString().split('.')[0]),
          document['startTime'].toDate().difference(now) <=
                  Duration(
                    days: 0,
                    hours: 0,
                    minutes: 0,
                    seconds: 10,
                  )
              ? Text(
                  document['startTime']
                      .toDate()
                      .difference(now)
                      .toString()
                      .split('.')[0],
                  textScaleFactor: 4,
              style: TextStyle(
                  color: Colors.red,
                fontWeight: FontWeight.bold
              )
                )
              : Text(
                  document['startTime']
                      .toDate()
                      .difference(now)
                      .toString()
                      .split('.')[0],
                  textScaleFactor: 4,

                )
        ],
      ),
    );
  }

  Widget quizEndTime(DocumentSnapshot document) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            document['endTime']
                .toDate()
                .difference(now)
                .toString()
                .split('.')[0],
            textScaleFactor: 1,
          )
        ],
      ),
    );
  }
}
