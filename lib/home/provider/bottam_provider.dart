import 'package:flutter/material.dart';

class bootam_Provider extends ChangeNotifier{

  int i=0;

  void changeicon(int index){
    i = index;
    notifyListeners();
  }
}