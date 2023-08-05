import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier{
  var indexno=0;
  changeIndex(p){
    indexno=p;
    notifyListeners();
  }
}