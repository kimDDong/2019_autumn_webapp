import 'package:flutter/cupertino.dart';
import 'package:polygon_clipper/polygon_clipper.dart'; // Import package for ClipPolygon
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      // 아래
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              // 옆으로
              Make_hexagon(
                  'https://selab.hanyang.ac.kr/research/images/web_securitymodified.png',
                  120),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      children: <Widget>[
                        Make_sentence(1,"Semantic web"),
                        Make_sentence(2,"Effective Access Control for Web Data"),
                        Make_sentence(
                            1,"Vulnerability Analysis and Detection for HTML5"),
                        Make_sentence(2,"JavaScript and Hybrid Application")
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width * 0.55,
                child: Column(
                  children: <Widget>[
                    Make_sentence(1,"Semantic web"),
                    Make_sentence(2,"Effective Access Control for Web Data"),
                    Make_sentence(
                        1,"Vulnerability Analysis and Detection for HTML5"),
                    Make_sentence(2,"JavaScript and Hybrid Application")
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Make_hexagon(
                  "https://selab.hanyang.ac.kr/research/images/formalmethod.png",
                  130)
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        ),
      ],
    ));
  }

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

    if(number == 2){
      now = Colors.grey[600];
    }

    return Container(
      child: Column(children: <Widget>[
        Text(str, style: TextStyle(
          fontSize: 15,
          color: now,
        ),),
      ],),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

//Make_sentence(str) {
//  return Container(
//    child: Row(
//      children: <Widget>[
//        Text("•"),
//        Text(
//          str,
//          textAlign: TextAlign.left,
//          style: TextStyle(
//            fontSize: 15,
//          ),
//        ),
//      ],
//    ),
//    margin: EdgeInsets.only(bottom: 2),
////        width: 100,
//  );
//}
