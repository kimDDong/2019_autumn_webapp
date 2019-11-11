import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'menubar.dart';

class LoginPage extends StatelessWidget {
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
            Image.asset(
              'images/graduateshool.png',
              width: size.width
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    InputForm(),

                  ],
                ),

              ],
            ),
          ],
        ));
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 20),
          child: Center(
              child: _isLoggedIn
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                  Text(_googleSignIn.currentUser.displayName),
                  OutlineButton( child: Text("Logout"), onPressed: (){
                    _logout();
                  },)
                ],
              )
                  : Center(
                child: OutlineButton(
                  child: Text("Login with Google"),
                  onPressed: () {
                    _login();
                  },
                ),
              )),
        ),
      ),
    );
  }

}




