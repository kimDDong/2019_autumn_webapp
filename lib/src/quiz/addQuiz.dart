import 'package:flutter/material.dart';
import 'package:untitled3/src/quiz/addBlankQuiz.dart';
import 'package:untitled3/src/quiz/addChoiceQuiz.dart';

class AddQuiz extends StatefulWidget{
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[

      BlankQuiz(),
      ChoiceQuiz(),
    ];
    final _kTabs = <Tab>[
      Tab(child: Text("BLANK")),
      Tab(child: Text("CHOICE"),),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height:100,child: Image.asset('images/logo.png')),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.white54,
            labelColor: Colors.white,
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );

  }
}