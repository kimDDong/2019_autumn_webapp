import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/src/undergraduate.dart';
import 'package:untitled3/src/startpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness:Brightness.dark,
      ),
      title: "Hello",
      home: StartUp(),
      );
  }
}