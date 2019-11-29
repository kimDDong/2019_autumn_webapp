//import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/src/home/notice.dart';
import 'package:untitled3/src/etc/course2.dart';
import 'package:date_format/date_format.dart';
import '../etc/menubar.dart';

class LabHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: Column(
        children: <Widget>[
          seGallery(size),
          notice(context),
          Course(context),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  @override
  Widget notice(BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom : 30),
          width: MediaQuery.of(context).size.width * 0.85,
          height:MediaQuery.of(context).size.height*0.2,
          decoration: new BoxDecoration(
            border: Border(
              left: BorderSide(width: 1.0, color: Colors.grey[200]),
              top: BorderSide(width: 1.0, color: Colors.grey[200]),
              right: BorderSide(width: 1.0, color: Colors.grey[200]),
              bottom: BorderSide(width: 1.0, color: Colors.grey[200]),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 3.0, // has the effect of extending the shadow
                offset: Offset(
                  5, // horizontal, move right 10
                  5, // vertical, move down 10
                ),
              )
            ],
//              borderRadius: new BorderRadius.all(…),
//              gradient: new LinearGradient(…),
          ),
          child:Row(
              children: <Widget>[
                Text('NOTICE'),

                Container(
                  margin: EdgeInsets.only(right: 0),
                  width: 50,
                  height: 50,

                ),
                Container(
                  width: 0,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey[400]),
                      ),
                      color: Colors.grey[200]),
                ),
                Container(
                    child:Column(
                      children: <Widget>[
                        notice2(),



                      ],
                    )

                ),
              ]
          ),
        ),

        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Notice()));



        }
    );
  }




//  @override
//  Widget notice(BuildContext context) {
//
//    return InkWell(
//      child: Column(
//        children: <Widget>[
//          Container(
//            margin: EdgeInsets.all(20),
//            width: MediaQuery.of(context).size.width * 0.95,
//            height:MediaQuery.of(context).size.height*0.2,
//
//
//            decoration: new BoxDecoration(
//                border:Border.all(
//                  width:1,
//                  color: Color.fromRGBO(111, 111, 191, 0.2),
//
//                ),
////                color: Color.fromRGBO(111, 111, 191, 0.2),
//
//                borderRadius: BorderRadius.all(Radius.circular(0.0))
//
//            ),
//
//
//
//
//            padding: EdgeInsets.all(20.0),
//
//            child: Column(
//              children: <Widget>[
//                Text('NOTICE'),
//                notice2(),
//              ],
//            )
//
//          ),
//
//        ],
////        crossAxisAlignment: CrossAxisAlignment.end,
////        mainAxisAlignment: MainAxisAlignment.end,
//      ),
//
//      onTap: () {
//        Navigator.of(context)
//            .push(MaterialPageRoute(builder: (context) => Notice()));
//      },
//    );
//  }
//


  @override
  Widget Course(BuildContext context) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height:MediaQuery.of(context).size.height*0.2,
          decoration: new BoxDecoration(
            border: Border(
              left: BorderSide(width: 1.0, color: Colors.grey[200]),
              top: BorderSide(width: 1.0, color: Colors.grey[200]),
              right: BorderSide(width: 1.0, color: Colors.grey[200]),
              bottom: BorderSide(width: 1.0, color: Colors.grey[200]),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 3.0, // has the effect of extending the shadow
                offset: Offset(
                  5, // horizontal, move right 10
                  5, // vertical, move down 10
                ),
              )
            ],
//              borderRadius: new BorderRadius.all(…),
//              gradient: new LinearGradient(…),
          ),
          child:Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 0),
                  width: 100,
                  height: 50,
                  child: Text("COURSE"),



                ),
                Container(
                  width: 0,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey[400]),
                      ),
                      color: Colors.grey[200]),
                ),
                Container(
                    child:Column(
                      children: <Widget>[



                      ],
                    )

                ),
              ]
          ),
        ),

        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CoursePage2()));
        }
    );
  }



  Widget seGallery(Size size) {
    return Container(
      height: size.height * 0.2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: Card(
              child: Image.asset('images/img4.png'),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: () {},
          ),
          InkWell(
            child: Card(
              child: Image.asset(
                'images/img3.png',
              ),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: () {},
          ),
          InkWell(
            child: Card(
              child: Image.asset('images/img2.png'),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: () {},
          ),

        ],
      ),
    );
  }



}




//
//class Home1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final Size size = MediaQuery.of(context).size;
//    return Scaffold(
//
//      endDrawer: MenuForGraduate(),
//      body: ListView(
//        children: <Widget>[
//            Text("aa"),
////          seGallery(size),
////          noticeBanner(size),
////          notice2(),
////          courseBanner(size),
//        ],
//      ),
//    );
//  }
//
//
//  Widget noticeBanner(Size size) {
//    return Container(
//      padding: const EdgeInsets.only(top: 20),
//      child: Row(
//        children: <Widget>[
//          Text("a"),
//        ]
//
////        InkWell(
////          child: Container(
////              padding: EdgeInsets.all(12.0),
////              child: Text('Flat Button'),
////              ),
////          onTap: () {
////            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap')));
////          },
////    );
//      ),
//    );
//  }
//
//
//
Widget notice2() {
  return StreamBuilder(
      stream: Firestore.instance
          .collection('notice')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return Container(
            child: _buildListItem(context, snapshot.data.documents[0])
        );

      }
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  String time = formatDate(document['date'].toDate(),[mm,"/",dd]);
  return Container(
      child: Column(children: <Widget>[
        Text(document['title']),
        Text(time),
      ],)
  );
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

//  Widget courseBanner(Size size) {
//    return Container(
//      padding: const EdgeInsets.only(top: 32),
//      child: Row(
//        children: [
//          Flexible(
//            /*1*/
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                /*2*/
//                Container(
//                  padding: const EdgeInsets.only(bottom: 8),
//                  child: Text(
//                    'COURSES',
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 30,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          /*3*/
//          Icon(
//            Icons.collections_bookmark,
//            color: Colors.white,
//            size: 50,
//          )
//        ],
//      ),
//    );
//  }
//
//
//
//  Widget seGallery(Size size) {
//    return Container(
//      height: size.height * 0.2,
//      child: ListView(
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          InkWell(
//            child: Card(
//              child: Image.asset('images/img2.png'),
//              margin: EdgeInsets.all(10),
//              color: Colors.black12,
//            ),
//            onTap: () {},
//          ),
//          InkWell(
//            child: Card(
//              child: Image.asset(
//                'images/img3.png',
//              ),
//              margin: EdgeInsets.all(10),
//              color: Colors.black12,
//            ),
//            onTap: () {},
//          ),
//          InkWell(
//            child: Card(
//              child: Image.asset('images/img4.png'),
//              margin: EdgeInsets.all(10),
//              color: Colors.black12,
//            ),
//            onTap: () {},
//          ),
//
//        ],
//      ),
//    );
//  }
//}