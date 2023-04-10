import 'package:flutter/material.dart';

import '../modal/news_modal.dart';
import '../utiles/apihelper.dart';

class NewsProvider extends ChangeNotifier {
  NewsModal? NewsdataModal;
  String selestedCountry = 'in';
  String selectedcat='business';

  Future<NewsModal?> getNews(String country,String  work) async {
    ApiHelper apiHelper = ApiHelper();
    NewsModal? newsModal = await apiHelper.newsApi(country,work);
    NewsdataModal = newsModal;
    return newsModal;
  }

  void changeCountry(String selectedCon) {
    selestedCountry = selectedCon;
    notifyListeners();
  }

  void chengeWork(String work){
    selectedcat=work;
    notifyListeners();
  }
}
