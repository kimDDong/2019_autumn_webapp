import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:untitled3/src/etc/course.dart';
import 'package:untitled3/src/etc/menubar.dart';

class UnderGraduate extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Undergraduate School"),
        ),
        endDrawer: MenuForStudent(),
        body: Column(
          children: <Widget>[
            Image.asset(
              'images/undergraduate.png',
              width: size.width,
            ),
            noticeBanner(),
            notice(),
            courseBanner(context),
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

  Widget courseBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CoursePage()));
      },
      child: Container(
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
}
