import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                "Engineering Building #3, Room 421 HANYANG UNIVERSITY ERICA CAMPUS 55, Hanyangdaehak-ro, Sangnok-gu, Ansan-si, Gyeonggi-do"),
          ),
          Divider(),
          ListTile(
            title: Text("경기도 안산시 상록구 한양대학로 55 제3공학관 421"),
          ),
          Divider(),
          ListTile(
            title: Text("email"),
          ),
          Divider(),
          ListTile(
            title: Text("만든이"),
          ),
        ],
      ),
    );
  }
}
