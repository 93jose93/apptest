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

  getUserslines() async {
    // print('Cargando servicios....');
    final url = Uri.https(
      'randomuser.me',
      '/api/',
      {'results': '50'},
    );
    final response = await http.get(url);

    final newsResponse = newsMoldesFromJson(response.body);
    // print(newsResponse.results[0].email);

    userlines = newsResponse.results;
    //notifica los cambios del provider o widgets
    notifyListeners();
  }
}
