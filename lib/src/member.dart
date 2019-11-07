import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("MEMBERS"),
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            var info = Text("input");
            if (index.isOdd) {
              return Divider();
            } else {
              return info;
            }
          })),
    );
  }
}
