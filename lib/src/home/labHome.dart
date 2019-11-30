//import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/src/home/notice.dart';
import 'package:untitled3/src/etc/course2.dart';
import 'package:date_format/date_format.dart';
import '../etc/menubar.dart';

class LabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: Column(
        children: <Widget>[
<<<<<<< HEAD
<<<<<<< Updated upstream
          Container(child: Image.asset('images/hanyang.png'),margin: EdgeInsets.only(left: 30,right: 30),),

=======
          Image.asset(
      'images/logo.png ',
            width: size.width,
            height: 150,
          ),
>>>>>>> Stashed changes
          noticeBanner(context),
          notice(context),
          courseBanner(context),
          course(),
=======
          Container(
            decoration: BoxDecoration(color: Colors.black38),
            child: Image.asset('images/hanyang.png'),
            padding: EdgeInsets.only(left: 30, right: 30),
          ),
          Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.18,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(color: Colors.black26),
              child: Column(
                children: <Widget>[
                  noticeBanner(context),
                  notice2(),
                ],
              )),
          Container(
            decoration: BoxDecoration(color: Colors.black26),
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                courseBanner(context),
                course(),
              ],
            ),
          ),
>>>>>>> flutterV2
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
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
        children: <Widget>[
          Container(
            child: Icon(
              Icons.playlist_add_check,
              color: Colors.white,
              size: 40,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'NOTICE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),

          /*3*/
        ],
      ),
    );
  }

  Widget notice2() {
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Icon(
                        Icons.lens,
                        color: Colors.orange[400],
                        size: 12,
                      ),
                      Text(snapshot.data.documents[index]['title']),
                    ],
                  );
                });
//          return Container(
//              child: _buildListItem(context, snapshot.data.documents[0])
//          );
          }),
    );
  }

  Widget course() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'CSE326 Web Application Development\n'
        'CSE6050 Advanced Software Engineering',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget courseBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CoursePage2()));
      },
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.people_outline,
              color: Colors.white,
              size: 35,
            ),
            Flexible(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            /*3*/
          ],
        ),
      ),
    );
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  String time = formatDate(document['date'].toDate(), [mm, "/", dd]);
  return Container(
      child: Column(
    children: <Widget>[
      Text(document['title']),
      Text(time),
    ],
  ));
}

Widget course() {
  return Container(
//      padding: const EdgeInsets.all(32),
    child: Text(
      'CSE326 Web Application Development\n'
      'CSE6050 Advanced Software Engineering',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
