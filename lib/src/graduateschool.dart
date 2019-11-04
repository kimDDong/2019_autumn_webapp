import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

import 'menubar.dart';

class GraduateSchool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Graduate School"),
        ),
        endDrawer: MenuForGraduate(),
        body: Column(
          children: <Widget>[
            Image.asset(
              'images/graduateshool.png',
              width: 1200,
            ),
            seGallery(),
            noticeBanner(),
            notice(),
            courseBanner(),
            course()
          ],
        ));
  }

  Widget noticeBanner() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Flexible(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
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
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.rss_feed,
            color: Colors.white,
            size: 50,
          )
        ],
      ),
    );
  }

  Widget notice() {
    return Container(
//      padding: const EdgeInsets.all(32),
      child: Text(
        '2014 PL-SE First Joint Workshop\n'
            'Welcome to SElab Homepage!',
        softWrap: true,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget courseBanner() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Flexible(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
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
          Icon(
            Icons.collections_bookmark,
            color: Colors.white,
            size: 50,
          )
        ],
      ),
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

  Widget seGallery() {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: Card(
              child: Image.asset('images/doo.png'),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: (){},
          )
          ,
          InkWell(
            child: Card(
              child: Image.asset('images/park.png',),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: (){},
          ),
          InkWell(
            child: Card(
              child: Image.asset('images/logo.png'),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: (){},
          ),
          InkWell(
            child: Card(
              child: Text("여기에 사진을 넣는다~이말이야이말이야이말이야"),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: (){},
          ),
          InkWell(
            child: Card(
              child: Text("여기에 사진을 넣는다~이말이야이말이야이말이야"),
              margin: EdgeInsets.all(10),
              color: Colors.black12,
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
