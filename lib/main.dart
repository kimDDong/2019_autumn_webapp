import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/addnotice.dart';
import 'package:untitled3/src/islogin.dart';
import 'package:untitled3/src/notice.dart';
import 'package:untitled3/src/startpage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:device_id/device_id.dart';



FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//void main() => runApp(MyApp());

void main() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final db = Firestore.instance;

  @override
  initState() {
    //Local Notification
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    firebaseCloudMessaging_Listeners(); // firebase message
  }

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      builder: (_)=> Counter(),
      child: MaterialApp(
        theme: ThemeData(
          brightness:Brightness.dark,
        ),
        title: "Hello",
        home: StartUp(),
      ),
    );
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: body != null ? Text(body) : null,
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Notice()));
            },
          )
        ],
      ),
    );
  }

  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }

    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notice()));
  }

  void firebaseCloudMessaging_Listeners() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//    if(db.collection('device').snapshots()){

//    }
    db.document('device');
    if (Platform.isIOS) {
      iOS_Permission();
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      _firebaseMessaging.getToken().then((token) {
        print(token);
        db.collection('device').document(iosDeviceInfo.identifierForVendor).setData(
            {
              'token': token,
            }
            ,merge: true
        );
      });
    }

    if (Platform.isAndroid){
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      _firebaseMessaging.getToken().then((token) {
        print(token);
        db.collection('device').document(androidDeviceInfo.androidId).setData(
            {
              'token': token,
            }
            ,merge: true
        );
      });
    }


    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        showNotification(message['notification']['body'].toString());
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  Future<void> showNotification(String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'SElab 공지사항', body, platformChannelSpecifics,
        payload: 'item x');
  }
}
