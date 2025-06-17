import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import '../models/apod.dart';

// Servicio para consumir la API de NASA
class NasaApiService{
  final _translator = GoogleTranslator();

  static const String _baseUrl =
      "https://api.nasa.gov/planetary/apod?api_key=PJcoIoNKtaARlwah8DiTdj0uPTXbq9mH31PxQ1YX";

  Future<Apod> fetchApod() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final translatedTitle = await _translator.translate(
        json['title'], from: 'en', to: 'es');
      final translatedExplanation = await _translator.translate(
        json['explanation'], from: 'en', to: 'es');
      return Apod(
        title: translatedTitle.text,
        explanation: translatedExplanation.text,
        imageUrl: json['url'],
      );
    } else {
      throw Exception('Error al cargar la imagen del día');
    }
  }
}
