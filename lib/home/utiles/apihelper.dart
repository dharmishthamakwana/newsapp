import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/news_modal.dart';

class ApiHelper {
  NewsModal? newsModal;

  Future<NewsModal?> newsApi(String country, String work) async {
    String? apiLink =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$work&apiKey=afc7da056aa44a98a139035e8e1150b3";
    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsModal newsModal = NewsModal.fromJson(json);
    return newsModal;
  }
}
