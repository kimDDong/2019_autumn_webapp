import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Contact extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Contact> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 300,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
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
      ),
    );
  }
}
