import 'package:flutter/material.dart';

class AlertCategory extends StatefulWidget {
  @override
  _AlertCategoryState createState() => _AlertCategoryState();
}

class _AlertCategoryState extends State<AlertCategory> {
  var categories = ['None','Notice','Course','Course Slide'];
  List<String> selected = List<String>();

  count(BuildContext context){
    if(selected.contains('None')){
      return 1;
    }
    else{
      return categories.length;
    }
  }

  void state(bool value,int index){
    if (value){
      setState(() {
        selected.add(categories[index]);
      });
    }
    else{
      setState(() {
        selected.remove(categories[index]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title : Text('알림을 수신받을 방법을 선택하세요')
        ),
        body : ListView.builder(
            itemCount: count(context),
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Container(
                    child : Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title : Text(categories[index]),
                          onChanged : (bool value){state(value, index);},
                          value: selected.contains(categories[index]),
                          activeColor: Colors.orange[300],
                        )
                      ],
                    )
                ),
              );
            }
        )
    );
  }
}

