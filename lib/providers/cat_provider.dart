import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/api_services.dart';

class CatProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<CatF> _catList = [];
  bool _isLoading = false;

  List<CatF> get catsList => _catList;
  bool get isLoading => _isLoading;

  Future<void> fetchCATS() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Llamamos al método actualizado de ApiService que devuelve un solo CatF
      CatF catFact = await _apiService.fetchCatsList();

      // Limpiamos la lista antes de añadir el nuevo hecho de gato
      _catList.clear();

      // Añadimos el nuevo hecho de gato a la lista
      _catList.add(catFact);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // Manejo de errores, por ejemplo:
      print('Error fetching cat facts: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
}
