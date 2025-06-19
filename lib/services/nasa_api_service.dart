import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import '../models/apod.dart';

// Servicio para consumir la API de NASA
class NasaApiService extends ChangeNotifier {
  Apod apodDeHoy = Apod(title: '', explanation: '', imageUrl: '');
  final _translator = GoogleTranslator();
  List<Apod> favoritesApod = [];
  bool cargado = false;
  bool isLoading = false;

  static const String _baseUrl =
      "https://api.nasa.gov/planetary/apod?api_key=PJcoIoNKtaARlwah8DiTdj0uPTXbq9mH31PxQ1YX";

  Future<void> fetchApod() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final translatedTitle = await _translator.translate(
          json['title'],
          from: 'en',
          to: 'es',
        );
        final translatedExplanation = await _translator.translate(
          json['explanation'],
          from: 'en',
          to: 'es',
        );
        apodDeHoy = Apod(
          title: translatedTitle.text,
          explanation: translatedExplanation.text,
          imageUrl: json['url'],
        );
        cargado = true;
      } else {
        cargado = false;
      }
    } catch (e) {
      cargado = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Apod apod) async {
    final isFavorite = favoritesApod.contains(apod);

    try {
      if (isFavorite) {
        favoritesApod.remove(apod);
      } else {
        favoritesApod.add(apod);
      }
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
