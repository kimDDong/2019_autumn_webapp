import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled3/src/grade/student.dart';
import 'package:untitled3/src/signInOut/authentication.dart';
import 'package:untitled3/src/signInOut/root_page.dart';

class ManageStudent extends StatefulWidget {
  @override
  _ManageStudentState createState() => _ManageStudentState();
}

class _ManageStudentState extends State<ManageStudent> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        leading: email3 == "aldehf420@gmail.com"
            ? Center(child: Text("  ADMIN",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),))
            : null,
        elevation: 0,
        actions: <Widget>[
          email3 == null
              ? IconButton(
            icon: Icon(Icons.person),
            onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RootPage(auth: Auth())))
            ,
          )
              : IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () =>
                _showDialog(context)
            ,
          )
        ],
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

  void _showDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text("Do you want Sign Out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async {
                _firebaseAuth.signOut();
                setState(() {
                  email3=null;
                });
                Navigator.of(context).pop();
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
