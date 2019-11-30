import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:untitled3/src/sign/sign_in.dart';

import 'grade.dart';

class Student extends StatefulWidget {
  DocumentSnapshot document;

  Student(DocumentSnapshot document) {
    this.document = document;
  }

  @override
  _StudentState createState() => _StudentState(document);
}

class _StudentState extends State<Student> {
  TextEditingController _absent = TextEditingController();
  TextEditingController _midterm = TextEditingController();
  TextEditingController _final = TextEditingController();
  TextEditingController _quiz = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int absent;

  int quiz;

  int midtermExam;

  int finalExam;

  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;

  @override
  initState(){
    super.initState();
    setState(() {
      a = double.parse(document['grade_absent'].toString());
      b = double.parse(document['grade_final'].toString());
      c = double.parse(document['grade_mid'].toString());
      d = double.parse(document['grade_quiz'].toString());
    });
  }

//

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex;
  DocumentSnapshot document;

  _StudentState(DocumentSnapshot document) {
    this.document = document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _settingModalBottomSheet(context);
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => EditGrade(document)));
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(document['img']), fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        document['name'],
                        style: TextStyle(color: Colors.white70),
                      )),
                  Text(
                    "StudentID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        document['studentID'],
                        style: TextStyle(color: Colors.white70),
                      )),
                  Text(
                    "Major",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        document['major'].replaceAll(' ', '\n'),
                        maxLines: 2,
                        style: TextStyle(color: Colors.white70),
                      )),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        document['email'],
                        style: TextStyle(color: Colors.white70),
                      )),
                ],
              ),
            ],
          ),
          _buildListItem(context, document)
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {


    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Colors.black12,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Grade',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
        ],
      ),
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

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {

        switch (i) {
          case 0:
            return makeGroupData(0, (16 - a) * 30 / 16,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, b, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, c, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, d * 30 / 16, isTouched: i == touchedIndex);
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
                  weekDay = 'Quiz';
                  break;
              }
              return BarTooltipItem(weekDay + '\n' + (rod.y).toString(),
                  TextStyle(color: Colors.yellow));
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
                  return 'Attendance\n' + a.toString();
                case 1:
                  return 'Midterm\n' + b.toString();
                case 2:
                  return 'Final\n' + c.toString();
                case 3:
                  return 'Quiz\n' + d.toString();
                default:
                  return '';
              }
            }),
        leftTitles: const SideTitles(
          showTitles: true,
          interval: 5,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  void _settingModalBottomSheet(context) {
    absent = document['grade_absent'];
    quiz = document['grade_quiz'];
    midtermExam = document['grade_mid'];
    finalExam = document['grade_final'];

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                child: new Wrap(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Absent"),
                                FlatButton(
                                  child: Text(absent.toString()),
                                  onPressed: () {
                                    Picker(
                                        adapter: NumberPickerAdapter(data: [
                                          NumberPickerColumn(begin: 0, end: 16)
                                        ]),
                                        hideHeader: true,
                                        title:
                                            Center(child: new Text("Absent")),
                                        onConfirm: (Picker picker, List value) {
                                          setState(() {
                                            absent = value[0];
                                          });
                                        }).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Quiz"),
                                FlatButton(
                                  child: Text(quiz.toString()),
                                  onPressed: () {
                                    Picker(
                                        adapter: NumberPickerAdapter(data: [
                                          NumberPickerColumn(begin: 0, end: 16)
                                        ]),
                                        hideHeader: true,
                                        title: Center(child: new Text("Quiz")),
                                        onConfirm: (Picker picker, List value) {
                                          setState(() {
                                            quiz = value[0];
                                          });
                                        }).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Midterm"),
                                FlatButton(
                                  child: Text(midtermExam.toString()),
                                  onPressed: () {
                                    Picker(
                                        adapter: NumberPickerAdapter(data: [
                                          NumberPickerColumn(begin: 0, end: 30)
                                        ]),
                                        hideHeader: true,
                                        title:
                                            Center(child: new Text("Midterm")),
                                        onConfirm: (Picker picker, List value) {
                                          setState(() {
                                            midtermExam = value[0];
                                          });
                                        }).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Final"),
                                FlatButton(
                                  child: Text(finalExam.toString()),
                                  onPressed: () {
                                    Picker(
                                        adapter: NumberPickerAdapter(data: [
                                          NumberPickerColumn(begin: 0, end: 30)
                                        ]),
                                        hideHeader: true,
                                        title: Center(
                                            child: new Text("Final Exam")),
                                        onConfirm: (Picker picker, List value) {
                                          setState(() {
                                            finalExam = value[0];
                                          });
                                        }).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: RaisedButton(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: Text("Update!"))),
                        onPressed: (){
                          _showDialog(context);
                        },
                        color: Colors.orangeAccent,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text("Are you sure to update it?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () async {
                await Firestore.instance.collection('student').document(document.documentID).setData(
                    {
                      'grade_absent':absent,
                      'grade_quiz':quiz,
                      'grade_mid':midtermExam,
                      'grade_final':finalExam
                    }
                    ,merge: true
                );

                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
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
}
