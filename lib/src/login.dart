import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled3/src/info.dart';
import 'package:untitled3/src/sign_in.dart';
import 'menubar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/logo.png"), width: size.width,),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Information();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  bool isLoggedIn = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  login() async{
    try{
      await googleSignIn.signIn();
      setState(() {
        isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  logout(){
    googleSignIn.signOut();
    setState(() {

      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String user = googleSignIn.currentUser.displayName;
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
              child: isLoggedIn
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                  Text(googleSignIn.currentUser.displayName),
                  OutlineButton( child: Text("Logout"), onPressed: (){
                    logout();
                  },)
                ],
              )
                  : Center(
                child: OutlineButton(
                  child: Text("Login with Google"),
                  onPressed: () {
                    login();
                  },
                ),
              )),
        ),
      ),
    );
  }


}




