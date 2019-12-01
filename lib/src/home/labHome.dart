//import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/src/home/cse326.dart';
import 'package:untitled3/src/home/notice.dart';
import 'package:untitled3/src/home/course.dart';
import 'package:date_format/date_format.dart';

class LabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: ListView(
        children: <Widget>[


          Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(color: Colors.black38),
            child: Image.asset('images/hanyang.png'),
            padding: EdgeInsets.only(left: 30, right: 30),
          ),
          Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              height: MediaQuery.of(context).size.height * 0.18,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(color: Colors.black38),
              child: Column(
                children: <Widget>[
                  noticeBanner(context),
                  notice(),
                ],
              )),
          Container(
            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),

            decoration: BoxDecoration(color: Colors.black38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                courseBanner(context),
                course(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget noticeBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Notice()));
      },
//      padding: const EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
//            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'NOTICE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.rss_feed,
              color: Colors.white,
              size: 40,
            ),
          ),

          /*3*/
        ],
      ),
    );
  }

  Widget notice() {
    return Flexible(
      child: StreamBuilder(
          stream: Firestore.instance
              .collection('notice')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.documents.length >= 5
                    ? 5
                    : snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 5),
                          child: Icon(
                            Icons.lens,
                            color: Colors.orange[400],
                            size: 7,
                          ),
                        ),
                        Text(snapshot.data.documents[index]['title']),
                      ],
                    ),
                  );
                });
//          return Container(
//              child: _buildListItem(context, snapshot.data.documents[0])
//          );
          }),
    );
  }

  Widget course(BuildContext context) {
//    Text('CSE326 Web Application Development'),
//    Text(
//    'CSE6050 Advanced Software Engineering',
//    )
    return Container(
      padding: EdgeInsets.only(bottom: 10),
        child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(color: Colors.black26),
              margin: EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.2,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CSE326',
                      textScaleFactor: 2,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Web Application Development',
                      textScaleFactor: 0.8,
                    ),
                  ],
                )),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CSE326()));
                },
              )),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.black26),
            margin: EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('CSE6050',
                      textScaleFactor: 2,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'Advanced Software Engineering',
                    textScaleFactor: 0.8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget courseBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CoursePage2()));
      },
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.end
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'COURSES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 35,
            ),
          ),
          /*3*/
        ],
      ),
    );
  }
}


