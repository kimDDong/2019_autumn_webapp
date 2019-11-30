import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('quiz')
            .orderBy('startTime')
            .snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return quizCard(index, snapshot.data.documents[index]);
              });
        },
      ),
    );
  }

  Widget quizCard(int index, DocumentSnapshot document) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(color: Colors.white12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "The " + int2Ordinal(index + 1) + " Quiz Winner",
                textScaleFactor: 2,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,color: Colors.orangeAccent),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   getWinnerName(document['answerer'][0]),
                    Text(document['answerer'][0],textScaleFactor: 0.8,style: TextStyle(color: Colors.white70),)
                  ],
                ),
                Container(margin: EdgeInsets.only(left: 20),child: Text("#1/"+document['answerer'].length.toString(),textScaleFactor:2,))
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget getWinnerName(String studentId){
    return StreamBuilder(
      stream: Firestore.instance.collection('student').document(studentId).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Text("Not Found..");
        }
        return Text(snapshot.data['name'],textScaleFactor: 2,);
      },
    );
  }


  String int2Ordinal(int i) {
    switch (i % 10) {
      case 1:
        return i.toString() + "st";
      case 2:
        return i.toString() + "nd";
      case 3:
        return i.toString() + "rd";
      default:
        return i.toString() + "th";
    }
  }
}
