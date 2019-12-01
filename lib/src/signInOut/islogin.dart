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

  void admin(){
    _counter=2;
    notifyListeners();
  }

  final _howto = ['None', 'Push', 'Email'];
  final _categories = ['Notice','Course','CourseSlide'];
  List<String> _selected1 = ['Push','Email'];
  List<String> _selected2 = ['Notice','Course','CourseSlide'];


  getSelected1() => _selected1;
  getSelected2() => _selected2;
  getHowto(int index) => _howto[index];
  getCate(int index) => _categories[index];
  countCate()=>_categories.length;

  void how_state(bool value,int index){
    if (value){
      _selected1.add(_howto[index]);
      notifyListeners();
    }
    else{
      _selected1.remove(_howto[index]);
      notifyListeners();
    }
  }

  void cate_state(bool value,int index){
    if(value){
      _selected2.add(_categories[index]);
      notifyListeners();
    }
    else{
      _selected2.remove(_categories[index]);
      notifyListeners();
    }
  }
}