import 'package:flutter/material.dart';
import 'package:untitled3/src/home/cse326.dart';

class CoursePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(height: 100, child: Image.asset('images/logo.png')),
          elevation: 0,
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
  final Size size = MediaQuery.of(context).size;
  return ListView(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CSE326()));
          },
          leading: Icon(Icons.flag,color: Colors.orange,),
          title: Text(
            'Web Application Development',
            textScaleFactor: 1,
          ),
          subtitle: Text("CSE326"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {
          },
          leading: Icon(Icons.outlined_flag),
          title: Text(
            'Formal Methods',
            textScaleFactor: 1,
          ),
          subtitle: Text("CIN870"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.outlined_flag),
          title:
              Text('Management of Semistructured Data', textScaleFactor: 1),
          subtitle: Text("CSE603"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.outlined_flag),
          title: Text('Model Checking', textScaleFactor: 1),
          subtitle: Text("CSE609"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.outlined_flag),
          title: Text('Special Topics in Software Engineering',
              textScaleFactor: 1),
          subtitle: Text("CSE639"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(18)
        ),
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.outlined_flag),
          title: Text('Advanced Software Engineering', textScaleFactor: 1),
          subtitle: Text("CSE6050"),
        ),
      ),
    ],
  );
}
