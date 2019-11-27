import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/islogin.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        elevation: 0,
      ),
      body: getQuiz(),
    );
  }

  Widget getQuiz() {
    DateTime now = new DateTime.now();
    DateTime today = new DateTime(now.year, now.month, now.day);
    DateTime tommorow = new DateTime(now.year, now.month, now.day + 1);

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
            return Center(child: Text("준비중"));
          else {
            return blankQBuild(snapshot.data.documents[0]);
          }
        }
      },
    );
  }

  Widget blankQBuild(DocumentSnapshot document) {
    var questions = document['question'].replaceAll("\\n", "\n").split("\\b\\");
    List<Widget> list = new List<Widget>();
    List<String> answerList = new List();
    list.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        "QUESTION!",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.04,
            fontWeight: FontWeight.bold),
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
                  labelStyle: TextStyle(color: Colors.black45),
                  labelText: "Answer",
                  fillColor: Colors.black,
                  focusedBorder:new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.black45),
                  ),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.black45),
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

    list.add(Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () async {
                await Firestore.instance.collection(city).document('Attractions').updateData({"data": FieldValue.arrayUnion()});

//                Navigator.of(context)
//                    .popUntil(MaterialPageRoute(builder: (context) => Notice()));
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
        },
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        )));

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
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
          title: new Text("Alert"),
          content: new Text("Are you sure to add it?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async {
//                await db.collection('notice').add({
//                  'date': Timestamp.now()
//                });
//
////                Navigator.of(context)
////                    .popUntil(MaterialPageRoute(builder: (context) => Notice()));
//                int count = 0;
//                Navigator.of(context).popUntil((_) => count++ >= 2);
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
