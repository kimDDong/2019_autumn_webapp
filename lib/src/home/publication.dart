import 'package:flutter/material.dart';
import 'package:untitled3/src/home/showpub.dart';

class Publication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BodyLayout(),
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
  final Size size = MediaQuery.of(context).size;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
//      Container(
//        decoration: BoxDecoration(
//            color: Colors.blue,
//            borderRadius: BorderRadius.all(Radius.circular(25))),
//        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
//        height: size.height * 0.15,
//        child: ListTile(
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute<void>(
//                    builder: (BuildContext context) =>
//                        ShowPublication(category: 'International Conference')));
//          },
//          title: Text(
//            'International Conference',
//            textScaleFactor: 1.3,
//          ),
//        ),
//      ),
//      Container(
//        decoration: BoxDecoration(
//            color: Colors.blue,
//            borderRadius: BorderRadius.all(Radius.circular(25))),
//        height: size.height * 0.15,
//        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
//        child: ListTile(
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute<void>(
//                    builder: (BuildContext context) =>
//                        ShowPublication(category: 'International Journal')));
//          },
//          title: Text('International Journal', textScaleFactor: 1.3),
//        ),
//      ),
//      Container(
//        decoration: BoxDecoration(
//            color: Colors.blue,
//            borderRadius: BorderRadius.all(Radius.circular(25))),
//        height: size.height * 0.15,
//        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
//        child: ListTile(
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute<void>(
//                    builder: (BuildContext context) =>
//                        ShowPublication(category: 'Domestic Conference')));
//          },
//          title: Text('Domestic Conference', textScaleFactor: 1.3),
//        ),
//      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        height: size.height * 0.15,
        width: size.width,
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: FlatButton(
          child: Text("International Conference",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ShowPublication(category: 'International Conference')));
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        height: size.height * 0.15,
        width: size.width,
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: FlatButton(
          child: Text("International Journal",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ShowPublication(category: 'International Journal')));
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        height: size.height * 0.15,
        width: size.width,
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: FlatButton(
          child: Text("Domestic Conference",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ShowPublication(category: 'Domestic Conference')));
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        height: size.height * 0.15,
        width: size.width,
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: FlatButton(
          child: Text("Domestic Journal",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ShowPublication(category: 'Domestic Journal')));
          },
        ),
      ),
    ],
  );
}
