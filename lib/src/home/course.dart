import 'package:flutter/material.dart';
import 'package:untitled3/src/home/cse326.dart';

class CoursePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graduate Course"),
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
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => WebApplicationDevelopment()
  ));

  },
          leading: Icon(Icons.accessibility),
          title: Text(
            'Formal Methods',
            textScaleFactor: 1.2,
          ),
          subtitle: Text("CIN870"),
        ),
      ),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.airline_seat_flat),
          title:
              Text('Management of Semistructured Data', textScaleFactor: 1.3),
          subtitle: Text("CSE603"),
        ),
      ),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.web_asset),
          title: Text('Model Checking', textScaleFactor: 1.3),
          subtitle: Text("CSE609"),
        ),
      ),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.accessible),
          title: Text('Special Topics in Software Engineering',
              textScaleFactor: 1.3),
          subtitle: Text("CSE639"),
        ),
      ),
      Container(
        height: size.height * 0.1,
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.build),
          title: Text('Advanced Software Engineering', textScaleFactor: 1.3),
          subtitle: Text("CSE6050"),
        ),
      ),
    ],
  );
}
