import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  GoogleMapController mapController;

  final LatLng _selab = const LatLng(37.296386, 126.838947);
  final MarkerId markerId = MarkerId("test");
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Set<Marker> markers = Set();





  @override
  Widget build(BuildContext context) {
    markers.addAll([
      Marker(
          markerId: MarkerId('value'),
          infoWindow: InfoWindow(title: "학연산 클러스터", snippet: "6층 617호"),
          position: LatLng(37.296386, 126.838947)),

    ]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(height: 100, child: Image.asset('images/logo.png')),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(color: Colors.black45),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _selab,
                  zoom: 17,
                ),
                compassEnabled: true,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                    new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),),
                  ].toSet(),
                markers: markers,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 15, bottom: 5, left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "경기도 안산시 상록구 한양대학로 55",
                  textScaleFactor: 1.2,
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "학연산클러스터 ",
                          textScaleFactor: 1.2,
                        ),
                        Text(
                          "617",
                          textScaleFactor: 1.2,
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                        Text(
                          "호",
                          textScaleFactor: 1.2,
                        ),
                      ],
                    ))
              ],
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.email)),
                  Text(
                    'scottlee@hanyang.ac.kr',
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              onPressed: () {
                launch("mailto:scottlee@hanyang.ac.kr");
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.call)),
                  Text(
                    '+82-31-400-4754',
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              onPressed: () {
                launch("tel:031-400-4754");
              },
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Made by Team ',
                    textScaleFactor: 1.5,
                  ),
                  Text('S',
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.orangeAccent)),
                  Text(
                    'upermark',
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    'E',
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                  Text(
                    't',
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              onPressed: () {
                launch("https://github.com/gohdong/2019_autumn_webapp");
              },
            ),
          ),
        ],
      ),
    );
  }

}
