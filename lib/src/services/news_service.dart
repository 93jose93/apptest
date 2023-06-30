import 'package:flutter/material.dart';
import 'package:testapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  //aqui se obtienen los 50 usarios, resultados de la api
  List<Result> userlines = [];

  NewsService() {
    // print('Inicializar servicios....');
    getUserslines();
  }
  
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(
      'randomuser.me',
      endpoint,
      {
        'results': '50',
        'page': '$page'
      },
    );

    final response = await http.get(url);
    return response.body;
  }

  getUserslines() async {
    // print('Cargando servicios....');
    final jsonData = await _getJsonData('/api/');

    final newsResponse = newsMoldesFromJson(jsonData);
    // print(newsResponse.results[0].email);

    userlines = newsResponse.results;
    //notifica los cambios del provider o widgets
    notifyListeners();
  }
}
