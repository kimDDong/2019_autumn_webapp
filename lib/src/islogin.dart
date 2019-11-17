import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter=0;


  getCounter() => _counter;

  void increment() {
    _counter=1;
    notifyListeners();
  }

  void decrement() {
    _counter=0;
    notifyListeners();
  }

  final _howto = ['None', 'Push', 'Email'];
  List<String> _selected = List<String>();

  getSelected() => _selected;
  getHowto(int index) => _howto[index];

  void state(bool value,int index){
    if (value){
      _selected.add(_howto[index]);
      notifyListeners();
    }
    else{
      _selected.remove(_howto[index]);
      notifyListeners();
    }
  }
}