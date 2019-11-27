import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/src/sign_in.dart';

class BarChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  double number = 10.0;
  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;

//
//  DocumentSnapshot document;
//  final db = Firestore.instance
//      .collection('student')
//      .document('$email').snapshots();
//  QuerySnapshot eventsQuery = await db
//      .where("time", isGreaterThan: new DateTime.now().millisecondsSinceEpoch)
//      .where("food", isEqualTo: true)
//      .getDocuments();


  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('student')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error : ${snapshot.error}');
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

  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    a = double.parse(document['grade_attendance'].toString()) ;
    b = double.parse(document['grade_final'].toString());
    c = double.parse(document['grade_mid'].toString());
    d = double.parse(document['grade_quiz'].toString());
    print("dddddd : " + d.toString());
    return Column(
      children: <Widget>[
        Container(
          height: 300,
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.blueGrey,
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
                            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Your name',
                        style: TextStyle(
                            color: Colors.white30, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChart(mainBarData(),
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
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: isTouched ? y + 1 : y,
        color: isTouched ? Colors.yellow : barColor,
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y:31,
          color: Colors.black87,
        ),
      ),
    ], showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {
//    print(a);
    switch (i) {
      case 0:
        return makeGroupData(0, a, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, b, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, c, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, d, isTouched: i == touchedIndex);
      default:
        return null;
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white30,
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
                return
                  BarTooltipItem(
                      weekDay + '\n' + (rod.y - 1).toString(),
                      TextStyle(color: Colors.yellow));
              }),
          touchCallback: (barTouchResponse) {
          }
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 16,
            getTitles: (double value) {
              print("check");
              switch (value.toInt()) {
                case 0:
                  return 'Attendance';
                case 1:
                  return 'Midterm';
                case 2:
                  return 'Final';
                case 3:
                  return 'Quiz';
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
}