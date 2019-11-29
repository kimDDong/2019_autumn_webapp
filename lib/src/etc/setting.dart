import 'package:flutter/material.dart';
import 'package:untitled3/src/etc/alert_cate.dart';
import 'package:untitled3/src/etc/alert_howto.dart';
import 'package:untitled3/src/etc/disturbmode.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title : Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) => AlertCategory()));
              },
              title: Text('메세지 수신 설정', textScaleFactor: 1.3,),
            ),
          ),
          Divider(
              height: 10,
              color: Colors.white
          ),
          Container(
            height: size.height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) =>HowtoReceive()));
              },
              title: Text('메세지 수신방법 설정', textScaleFactor: 1.3,),
            ),
          ),
          Divider(
              height: 10,
              color: Colors.white
          ),
          Container(
            height: size.height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) => Massagecategory()));
              },
              title: Text('방해금지 시간대 설정', textScaleFactor: 1.3,),
            ),
          ),
        ],
      )
    );
  }
}

