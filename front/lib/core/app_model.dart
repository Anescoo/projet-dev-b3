import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  late int routIndex = 0;

  void setRoutIndex(int index){
    routIndex = index;
    notifyListeners();
  }
  
  int get currentRoutIndex => routIndex;
}