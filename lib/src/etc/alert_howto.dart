import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/sign/islogin.dart';

class HowtoReceive extends StatefulWidget {
  @override
  _HowtoReceiveState createState() => _HowtoReceiveState();
}

class _HowtoReceiveState extends State<HowtoReceive> {

  @override
  Widget build(BuildContext context) {
    var select = Provider.of<Counter>(context);
    List<String> selected = select.getSelected1();
    return Scaffold(
        appBar: AppBar(
            title : Text('알림을 수신받을 방법을 선택하세요')
        ),
        body : ListView.builder(
            itemCount: count(selected),
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Container(
                    child : Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title : Text(select.getHowto(index)),
                          onChanged : (bool value){select.how_state(value, index);},
                          value: selected.contains(select.getHowto(index)),
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

count(List selected){
  if(selected.contains('None')){
    return 1;
  }
  else{
    return 3;
  }
}