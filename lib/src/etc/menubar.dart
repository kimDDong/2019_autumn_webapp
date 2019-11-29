import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/etc/course2.dart';
import 'package:untitled3/src/etc/info.dart';
import 'package:untitled3/src/sign/islogin.dart';
import 'package:untitled3/src/sign/login.dart';
import 'package:untitled3/src/home/notice.dart';
import 'package:untitled3/src/home/publication.dart';
import 'package:untitled3/src/etc/setting.dart';
import 'package:untitled3/src/etc/startpage.dart';
import 'package:untitled3/src/etc/research.dart';
import 'package:untitled3/src/home/members.dart';
import 'package:untitled3/src/etc/gallery.dart';
import 'package:untitled3/src/etc/my_test.dart';

import 'contact.dart';

class MenuForGraduate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    counter.getCounter() == 0 ? 'Login' : 'Information',
                    textScaleFactor: 1.3,
                  ),
                  onTap: () {
                    Navigator.of(context).push(counter.getCounter() == 0
                        ? MaterialPageRoute(builder: (context) => LoginPage())
                        : MaterialPageRoute(builder: (context) => Information()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Contact',
                    textScaleFactor: 1.3,
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Contact()));
                  },
                ),
              ],
          )),
          ListTile(
            title: Text('Settings',textScaleFactor: 1.5,),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
          ListTile(
            title: Text(
              'Home',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => StartUp()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Notice',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Notice()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Members',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Members()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Members',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Members()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Research',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Research()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Publications',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Publication()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Courses',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CoursePage2()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Gallery',
              textScaleFactor: 1.5,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Gallery()));
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
              title: Text(
                'Login',
                textScaleFactor: 1.3,
              ),
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
