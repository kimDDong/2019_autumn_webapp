import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled3/src/grade/student.dart';

class ManageStudent extends StatefulWidget {
  @override
  _ManageStudentState createState() => _ManageStudentState();
}

class _ManageStudentState extends State<ManageStudent> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('student').orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width*1.23 /
                    (MediaQuery.of(context).size.height ),
              ),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return studentBuild(snapshot.data.documents[index]);
              });
        },
      ),
    );
  }

  Widget studentBuild(DocumentSnapshot document) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white10,),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(document['img'])
                      ,fit: BoxFit.cover
                ),
              ),
            ),
            Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: Text(document['name'],textScaleFactor: 1.5,)),
            Text(document['studentID'],style: TextStyle(color: Colors.white70),textScaleFactor: 0.9,)


          ],
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Student(document)));
        },
      ),
    );
  }




}
