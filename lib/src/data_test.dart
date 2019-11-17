//import 'dart:io';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:expandable/expandable.dart';
//
//import 'addnotice.dart';
//
//class Data_test extends StatefulWidget {
//  @override
//  _LoadDataFromFirestoreState createState() => _LoadDataFromFirestoreState();
//}
//
//class _LoadDataFromFirestoreState extends State<LoadDataFromFirestore> {
//  @override
//  void initState() {
//    super.initState();
//    getDriversList().then((results) {
//      setState(() {
//        querySnapshot = results;
//      });
//    });
//  }
//
//  QuerySnapshot querySnapshot;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _showDrivers(),
//    );
//  }
//
//  //build widget as prefered
//  //i'll be using a listview.builder
//  Widget _showDrivers() {
//    //check if querysnapshot is null
//    if (querySnapshot != null) {
//      return ListView.builder(
//        primary: false,
//        itemCount: querySnapshot.documents.length,
//        padding: EdgeInsets.all(12),
//        itemBuilder: (context, i) {
//          return Column(
//            children: <Widget>[
////load data into widgets
//              Text("${querySnapshot.documents[i].data['name']}"),
//              Text("${querySnapshot.documents[i].data['position']}"),
//              Text("${querySnapshot.documents[i].data['detail']}"),
//            ],
//          );
//        },
//      );
//    } else {
//      return Center(
//        child: CircularProgressIndicator(),
//      );
//    }
//  }
//
//  //get firestore instance
//  getDriversList() async {
//    return await Firestore.instance.collection('members').getDocuments();
//  }
//}
//
////
////
////class Data_test extends StatelessWidget {
////
////  @override
////  void initState() {
////    super.initState();
////    getDriversList().then((results) {
////      setState(() {
////      }
////        querySnapshot = results;
////      });
////    });
////  }
////
////
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(title: Text("Members")),
////      body: showDrivers(),
////    );
////  }
////
////
////  QuerySnapshot querySnapshot;
////  @override
////  Widget showDrivers(){
////    if (querySnapshot != null) {
////      return ListView.builder(
////          primary: false,
////          itemCount: querySnapshot.documents.length,
////          padding: EdgeInsets.all(12),
////    itemBuilder: (context, i) {
////    return Column(
////    children: <Widget>[
//////load data into widgets
////    Text("${querySnapshot.documents[i].data['activation']}"),
////    Text("${querySnapshot.documents[i].data['car1']}"),
////    Text("${querySnapshot.documents[i].data['car2']}"),
////    Text("${querySnapshot.documents[i].data['car5']}"),
////    Text("${querySnapshot.documents[i].data['name']}"),
////    Text("${querySnapshot.documents[i].data['phone']}"),
////    ],
////    );
////    },
////  }
////}
//
////class Data_test extends StatelessWidget {
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(title: Text("Members")),
////      body:
////      StreamBuilder<QuerySnapshot>(
////          stream: Firestore.instance.collection('join_members_gallery').snapshots(),
////          builder: (BuildContext context,
////              AsyncSnapshot<QuerySnapshot> snapshot) {
////            if (snapshot.hasError)
////              return new Text('Error : ${snapshot.error}');
////              final int messageCount = snapshot.data.documents.length;
////            switch (snapshot.connectionState) {
////              case ConnectionState.waiting:
////                return new Text("loading...");
////              default:
////                return new ListView.builder(
////                    itemCount : messageCount, // 없으면 에
////                    itemBuilder: (_, int index){
////                      final DocumentSnapshot document = snapshot.data.documents[index];
////                      return ListTile(
////                        title : Text(document['name']),
////                        subtitle : Text(document['title']),
////                      );
////                    }
////                );
////            }
////          }
////      ),
////    );
////  }
////}