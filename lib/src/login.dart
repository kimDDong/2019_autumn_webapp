import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  height: 3,
                ),
                Text("Forgot Password"),
                _authButton(size),
          

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _authButton(Size size) {
    return Container(
      padding: EdgeInsets.only(top :20),
      alignment: Alignment.center,
      child: SizedBox(
        height: size.height*0.05,
        width: size.width*0.7,
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




