import 'package:flutter/material.dart';

class HowtoReceive extends StatefulWidget {
  @override
  _HowtoReceiveState createState() => _HowtoReceiveState();
}

class _HowtoReceiveState extends State<HowtoReceive> {
  var howto = ['Push','Email','None'];
  List<bool> itemBool = List<bool>();

  @override
  void initState(){
    setState(() {
      for(int i=0;i<howto.length;i++){
        if(i==howto.length-1){
          itemBool.add(false);
        }
        else{
          itemBool.add(true);
        }
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
            title : Text('알림을 수신받을 방법을 선택하세요')
        ),
        body : ListView.builder(
            itemCount: itemBool.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Container(
                    child : Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title : Text(howto[index]),
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
