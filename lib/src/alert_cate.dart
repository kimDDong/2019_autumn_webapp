import 'package:flutter/material.dart';

class AlertCategory extends StatefulWidget {
  @override
  _AlertCategoryState createState() => _AlertCategoryState();
}

class _AlertCategoryState extends State<AlertCategory> {
  var categories = ['Notice','Course','Course Slide'];
  List<bool> itemBool = List<bool>();

  @override
  void initState(){
    setState(() {
      for(int i=0;i<categories.length;i++){
        itemBool.add(true);
      }
    });
  }

  void stateChange(bool value,int index){
    setState(() {
      itemBool[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('알림받을 게시판을 선택하세요.')
      ),
      body : ListView.builder(
          itemCount: itemBool.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Container(
                child : Column(
                  children: <Widget>[
                    CheckboxListTile(
                      title : Text(categories[index]),
                      value: itemBool[index],
                      activeColor: Colors.orange[300],
                      onChanged: (bool value){stateChange(value, index);},
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

