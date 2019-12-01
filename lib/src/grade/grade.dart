import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/grade/manageStudent.dart';
import 'package:untitled3/src/signInOut/root_page.dart';
import 'package:untitled3/src/signInOut/authentication.dart';
import 'package:untitled3/src/signInOut/islogin.dart';

class BarChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;
  double e = 0;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex;

  void _showDialog(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text("Do you want Sign Out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async {
                counter.decrement();
                _firebaseAuth.signOut();
                Navigator.of(context).pop();
              },
              textColor: Colors.blue,
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Colors.red,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    if (counter.getCounter() == 2) {
      return ManageStudent();
    } else if (counter.getCounter() == 1) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height: 100, child: Image.asset('images/logo.png')),
          elevation: 0,
          actions: <Widget>[
            counter.getCounter() == 0
                ? IconButton(
              icon: Icon(Icons.person),
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RootPage(auth: Auth())))
              ,
            )
                : IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () =>
                  _showDialog(context)
              ,
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('student')
                .where('email', isEqualTo: '$email3')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error : ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new Wrap(
//                  itemExtent: 80,
                    children: snapshot.data.documents
                        .map((document) => _buildListItem(context, document))
                        .toList(),
                  );
              }
            }),

      );

    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image.asset('images/logo.png'),
                  margin: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(18)
                  )),
              FlatButton(
                padding: EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SIGN ",
                      textScaleFactor: 3,
                    ),Text(
                      "IN",
                      textScaleFactor: 3,
                      style: TextStyle(
                        color: Colors.orangeAccent
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RootPage(auth: new Auth())));
                },
              ),
            ],
        ),
//        child: Column(
//          children: <Widget>[
//            Container(
//                alignment: Alignment.center,
//                width: 300.0,
//                height: 300.0,
//                child: Image.asset('images/logo.png'),
//                decoration: new BoxDecoration(
//                )),
//            RaisedButton(
//              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
//              color: Colors.amberAccent,
//              child: Text(
//                "Login",
//                textScaleFactor: 3,
//              ),
//              onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) => RootPage(auth: new Auth())));
//              },
//            ),
//          ],
//        ),
      );
    }
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    a = double.parse(document['grade_absent'].toString());
    b = double.parse(document['grade_mid'].toString());
    c = double.parse(document['grade_final'].toString());
    d = double.parse(document['grade_project'].toString());
    e = double.parse(document['grade_quiz'].toString());
    double total = (16 - a) * 10 / 16 + b + c + d + e;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Center(
                child: Text(
                  "G  R  A  D  E",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 3,
                ),
              ),
            )),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 10,right: 10,left: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Colors.black12,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            document['name'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            document['studentID'].toString(),
                            style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: BarChart(
                                mainBarData(),
                                swapAnimationDuration: animDuration,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.only(top: 20,bottom: 20),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(18)
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Total Score",
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      total.toString(),
                      textScaleFactor: 5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                getGrade(total),
                textScaleFactor: 5.5,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double,
                    color: Colors.orangeAccent),
              )))
            ],
          ),
        )
      ],
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          isRound: true,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 30,
            color: Colors.white12,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
//    print(a);
        switch (i) {
          case 0:
            return makeGroupData(0, (16 - a) * 30 / 16,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, b, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, c, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, d, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, e, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.black26,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Attendence';
                  break;
                case 1:
                  weekDay = 'Midterm';
                  break;
                case 2:
                  weekDay = 'Finals';
                  break;
                case 3:
                  weekDay = 'Project';
                  break;
                case 4:
                  weekDay = 'Quiz';
                  break;
              }
              if (group.x.toInt() == 0) {
                return BarTooltipItem(
                    weekDay + '\n' + (rod.y * 10 / 30).toString() + ' / 10.0',
                    TextStyle(color: Colors.yellow));
              } else if (group.x.toInt() == 4) {
                return BarTooltipItem(weekDay + '\n' + (rod.y).toString(),
                    TextStyle(color: Colors.yellow));
              } else {
                return BarTooltipItem(
                    weekDay + '\n' + (rod.y).toString() + ' / 30.0',
                    TextStyle(color: Colors.yellow));
              }
            }),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 15,
            getTitles: (double value) {
              print("check");
              switch (value.toInt()) {
                case 0:
                  return 'Attendance\n' + (10 - a).toString();
                case 1:
                  return 'Midterm\n' + b.toString();
                case 2:
                  return 'Final\n' + c.toString();
                case 3:
                  return 'Project\n' + d.toString();
                case 4:
                  return 'Quiz\n' + e.toString();
                default:
                  return '';
              }
            }),
        leftTitles: const SideTitles(
          showTitles: false,
          interval: 5,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  String getGrade(double total) {
    if (total >= 95)
      return "A + ";
    else if (total >= 90)
      return " A ";
    else if (total >= 85)
      return "B + ";
    else if (total >= 80)
      return " B ";
    else if (total >= 75)
      return "C + ";
    else if (total >= 70)
      return " C ";
    else if (total >= 65)
      return "D + ";
    else if (total >= 60)
      return " D ";
    else
      return " F ";
  }
}
