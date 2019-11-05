import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Table(border: TableBorder.all(), children: [
            TableRow(decoration: BoxDecoration(color: Colors.blue),
                children: [
              Text(
                "CSE107",
                textScaleFactor: 2,
              ),
              Text(
                "Logical Fundamentals of Programming",
                textScaleFactor: 1,
              ),
            ]),
            TableRow(children: [
              Text("item 3"),
              Text("item 4"),
            ]),
            TableRow(children: [
              Text("item 3"),
              Text("item 4"),
            ]),
            TableRow(children: [
              Text("item 3"),
              Text("item 4"),
            ]),
            TableRow(children: [
              Text("item 3"),
              Text("item 4"),
            ]),
          ]),
        ],
      ),
    );
  }
}
