import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/home_modal.dart';

class HomeProvider extends ChangeNotifier {
  int imgindex = 0;

  int i = 0;

  void change(int index) {
    i = index;
    notifyListeners();
  }

  List<Artical> articalList = [];

  Future<void> JsonParsing() async {
    String jsonStringData =
        await rootBundle.loadString('assets/json/extra.json');
    var jsonData = jsonDecode(jsonStringData);
    var list = jsonData['articles'] as List;
    articalList = list.map((e) => Artical().articalJson(e)).toList();
    notifyListeners();
  }
}
