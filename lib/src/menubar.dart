import 'package:flutter/material.dart';
import 'package:untitled3/src/login.dart';
import 'package:untitled3/src/notice.dart';
import 'package:untitled3/src/startpage.dart';
import 'package:untitled3/src/testlogin.dart';
import 'package:untitled3/src/members.dart';


class MenuForGraduate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: ListTile(
              title: Text('Login',textScaleFactor: 1.3,),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),

          ),
          ListTile(
            title: Text('Home',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => StartUp()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notice',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Notice()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Members',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Members()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Members',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Research',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Publications',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Courses',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Gallery',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class MenuForStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: ListTile(
              title: Text('Login',textScaleFactor: 1.3,),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),

          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}