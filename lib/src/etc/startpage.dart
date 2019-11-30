import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/etc/graduateschool.dart';
import 'package:untitled3/src/sign/islogin.dart';
import 'package:untitled3/src/sign/login.dart';
import 'package:untitled3/src/sign/sign_in.dart';
import 'package:untitled3/src/etc/undergraduate.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('SELab'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
          ),
          Image.asset('images/logo.png'),
          selectMode(context),
          Container(
            child: Text(counter.getCounter()==0?
            "":"${name}님"),
            height: 30,
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,

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
