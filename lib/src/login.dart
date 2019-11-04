import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'menubar.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Graduate School"),
        ),
        endDrawer: MenuForGraduate(),
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/graduateshool.png',
              width: size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    _inputForm(size),
                    _authButton(size)
                  ],
                ),
                Container(
                  height: size.height * 0.3,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input corrext Email.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input corrext password.";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Text("Forgot Password")
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child:
            RaisedButton(
                color: Colors.amber,
                child: Text(
                   'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(_emailController.value.toString());
                  }
                }),
        ),
      );
  }

}



