import 'package:flutter/material.dart';

class Massagecategory extends StatefulWidget {
  Massagecategory({Key key}) : super(key: key);

  @override
  _massagecategoryState createState() => _massagecategoryState();
}

class _massagecategoryState extends State<Massagecategory> {
  var disturb = ['시작 시간', '종료 시간'];
  List<bool> itemBool = List<bool>();
  List _times = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _startTime;
  String _endTime;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _startTime = _dropDownMenuItems[0].value;
    _endTime = _dropDownMenuItems[1].value;
    setState(() {
      for (int i = 0; i < disturb.length; i++) {
        if (i == disturb.length - 1) {
          itemBool.add(false);
        } else {
          itemBool.add(true);
        }
      }
    });
    super.initState();
  }

  void stateChange(bool value, int index) {
    setState(() {
      itemBool[index] = value;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    for (String time in _times) {
      items.add(new DropdownMenuItem(value: time, child: new Text(time)));
    }

    return items;
  }

  void changedDropDownItemStart(String selectedTime) {
    setState(() {
      _startTime = selectedTime;
    });
  }
  void changedDropDownItemEnd(String selectedTime) {
    setState(() {
      _endTime = selectedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('방해 받지 않을 시간을 정하세요')),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: new Center(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(disturb[0]),
                    new DropdownButton(
                      value: _startTime,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItemStart,
                    ),
                    new Text(disturb[1]),
                    new DropdownButton(
                      value: _endTime,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItemEnd,
                    ),
                  ],
                )),
              );
            }));
  }
}
