import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/sign/islogin.dart';

class AlertCategory extends StatefulWidget {
  @override
  _AlertCategoryState createState() => _AlertCategoryState();
}

class _AlertCategoryState extends State<AlertCategory> {

  @override
  Widget build(BuildContext context) {
    var select = Provider.of<Counter>(context);
    List<String> selected = select.getSelected2();
    return Scaffold(
        appBar: AppBar(
            title : Text('알림을 수신받을 방법을 선택하세요')
        ),
        body : ListView.builder(
            itemCount: select.countCate(),
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Container(
                    child : Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title : Text(select.getCate(index)),
                          onChanged : (bool value){select.cate_state(value, index);},
                          value: selected.contains(select.getCate(index)),
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
