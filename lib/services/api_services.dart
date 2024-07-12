import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class ApiService {
  final String baseUrl = "https://cat-fact.herokuapp.com/facts";

  Future<CatF> fetchCatsList() async {
    final response = await http.get(Uri.parse('$baseUrl/random?animal_type=cat&amount=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CatF.fromJson(data);
    } else {
      throw Exception('Failed to load Cats');
    }
  }
}