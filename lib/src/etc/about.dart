import 'package:flutter/cupertino.dart';
import 'package:polygon_clipper/polygon_clipper.dart'; // Import package for ClipPolygon
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double title_margin = 10;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
//            Container(
//                width: MediaQuery.of(context).size.width * 1,
//                height: 75,
//                color: Colors.grey,
//                margin: EdgeInsets.only(top : 20),
//                child: Text(
//                  "RESEARCH",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                    fontSize: 60,
//                    color: Colors.black,
//                    fontFamily: 'Raleway-Black',
//                    fontWeight: FontWeight.bold,
//                  ),
//                )),

        // #1
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로
              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/web_securitymodified.png',
                  120),
              Container(
                margin:
                EdgeInsets.only(right: title_margin, left: title_margin),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                child: Make_title("Web & Web security"),
              ),
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        ),
        Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: title_margin, left: title_margin),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Make_sentence(1, "Semantic web"),
                      Make_sentence(2, "Effective Access Control for Web Data"),
                      Make_sentence(
                          1, "Vulnerability Analysis and Detection for HTML5"),
                      Make_sentence(2, "JavaScript and Hybrid Application")
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            )),

        Make_line(context),

        // #2
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로
              Container(
                margin:
                EdgeInsets.only(right: title_margin, left: title_margin),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                child: Make_title("Formal Engineering Methods"),
              ),

              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/formalmethod.png',
                  120),
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        ),
        Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: title_margin, left: title_margin),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Make_sentence(
                          1,
                          "Formal Specification, Validation, and Verification"),
                      Make_sentence(2, "Model checking, Theorem Proving"),
                      Make_sentence(1, "Ontology Reasoning, Constraint Solving")
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            )),

        Make_line(context),

        // #3
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로
              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/RE.png', 120),
              Container(
                margin:
                EdgeInsets.only(right: title_margin, left: title_margin),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                child: Make_title("Requirement Engineering"),
              ),
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        ),
        Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: title_margin, left: title_margin),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Make_sentence(1,
                          "Requirement Analysis, Validation and Conflict Detection"),
                      Make_sentence(
                          2,
                          "Non-Functional Requirements Analysis and Prediction"),
                      Make_sentence(
                          1, "Product Line and Software Product Line"),
                      Make_sentence(
                          2, "Requirement Modeling with Extended Mind Map"),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            )),

        Make_line(context),

        // #4
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로
              Container(
                margin:
                EdgeInsets.only(right: title_margin, left: title_margin),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                child: Make_title("Real-Time Software Engineering"),
              ),

              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/Realtime.png',
                  120),
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        ),
        Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: title_margin, left: title_margin),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Make_sentence(
                          1, 'Real-Time Software and Process Modeling'),
                      Make_sentence(
                          2,
                          "Real-Time Software Specification and Verification"),
                      Make_sentence(
                          1,
                          "Real-Time Software Integration and Migration Control")
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            )),

        Make_line(context),

        // #5
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로

              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/XML.png', 120),
              Container(
                margin:
                EdgeInsets.only(right: title_margin, left: title_margin),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                child: Make_title("Semi-structured Data"),
              ),
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        ),
        Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: title_margin, left: title_margin),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Make_sentence(
                          1, "RXML and XML DB, Visualization of XML-Schema"),
                      Make_sentence(2, "Ontology and RDF Store"),
                      Make_sentence(
                          1, "Semistructured Data Integration and Migration"),
                      Make_sentence(2, "Optimization of X-Query"),
                      Make_sentence(1,
                          "Consistency Verification for Semistructured Data Manipulation"),
                      Make_sentence(2,
                          "Domain Specific Extension to XML & Data Translation from RDBMS to XML DBMS"),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            )),

      ],),
    );
  }



  // REASEARCH WIDGETS

  @override
  Widget Make_hexagon(img, size) {
    return Container(
      width: 150,
      height: 150,
      child: ClipPolygon(
        sides: 6,
        borderRadius: 5.0,
        // Default 0.0 degrees
        rotate: 90.0,
        // Default 0.0 degrees
        boxShadows: [
//          PolygonBoxShadow(color: Colors., elevation: 1.0),
          PolygonBoxShadow(color: Colors.redAccent, elevation: 3.0)
        ],
        child: Image.network(
          img,
          cacheWidth: size,
        ),
      ),
    );
  }

  @override
  Make_sentence(number, str) {
    Color now = Colors.black;

    if (number == 2) {
      now = Colors.grey[600];
    }

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            str,
            style: TextStyle(
              fontSize: 15,
              color: now,
              fontFamily: 'Raleway-ExtraBold',
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  @override
  Make_title(str) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          str,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Raleway-Black',
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  @override
  Make_line(context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      margin: EdgeInsets.only(top: 40, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
            top:
            BorderSide(width: 1.0, color: Colors.grey[400]),
          ),
          color: Colors.grey[200]),
    );
  }

}



