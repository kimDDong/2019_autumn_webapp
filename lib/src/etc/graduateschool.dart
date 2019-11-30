import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'menubar.dart';

class GraduateSchool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Graduate School"),
      ),
      endDrawer: MenuForGraduate(),
      body: ListView(
        children: <Widget>[

          seGallery(size),
          noticeBanner(size),
          notice(),
          courseBanner(size),
          course(size)
        ],
      ),
    );
  }

  Widget noticeBanner(Size size) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
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
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Flexible(
                child: _buildListItem(context, snapshot.data.document[index]),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(
      child: Text(document['title']),
    );
  }

  Widget courseBanner(Size size) {
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

  Widget course(Size size) {
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

  Widget seGallery(Size size) {
    return Container(
      height: size.height * 0.2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: Card(
              child: Image.asset('images/img2.png'),
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
              child: Image.asset('images/img4.png'),
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