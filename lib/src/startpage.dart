import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled3/src/graduateschool.dart';
import 'package:untitled3/src/login.dart';
import 'package:untitled3/src/undergraduate.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELAB'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
          ),
          Image.asset('images/logo.png'),
          selectMode(context),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget selectMode(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: FlatButton(
          padding: EdgeInsets.all(0),
          child: Image.asset(
            'images/undergraduate.png',
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UnderGraduate()));
          },
        )),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Image.asset('images/graduateshool.png'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GraduateSchool()));
            },
          ),
        ),
      ],
    );
  }
}
