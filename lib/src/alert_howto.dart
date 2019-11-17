import 'package:flutter/material.dart';

class HowtoReceive extends StatefulWidget {
  @override
  _HowtoReceiveState createState() => _HowtoReceiveState();
}

class _HowtoReceiveState extends State<HowtoReceive> {
  var howto = ['None','Push','Email'];
  List<String> selected = List<String>();

  count(BuildContext context){
    if(selected.contains('None')){
      return 1;
    }
    else{
      return howto.length;
    }
  }

  void state(bool value,int index){
    if (value){
      setState(() {
        selected.add(howto[index]);
      });
    }
    else{
      setState(() {
        selected.remove(howto[index]);
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
                          title : Text(howto[index]),
                          onChanged : (bool value){state(value, index);},
                          value: selected.contains(howto[index]),
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
