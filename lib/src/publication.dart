import 'package:flutter/material.dart';
import 'package:untitled3/src/showpub.dart';

class Publication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publications"),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final Size size = MediaQuery
      .of(context)
      .size;
  return ListView(
    children: <Widget>[
      Divider(),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) => ShowPublication(category : 'International Conference'))
            );
          },
          title: Text('International Conference', textScaleFactor: 1.3,),
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
                MaterialPageRoute<void>(builder: (BuildContext context) => ShowPublication(category : 'International Journal'))
            );
          },
          title: Text('International Journal', textScaleFactor: 1.3),
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
                MaterialPageRoute<void>(builder: (BuildContext context) => ShowPublication(category : 'Domestic Conference'))
            );
          },
          title: Text('Domestic Conference', textScaleFactor: 1.3),
        ),
      ),
      Divider(
        height: 10,
        color: Colors.white,
      ),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) => ShowPublication(category : 'Domestic Journal'))
            );
          },
          title: Text('Domestic Journal', textScaleFactor: 1.3),
        ),
      ),
    ],
  );
}