import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practica8_200570/common/Constants.dart';
import 'package:practica8_200570/model/Media.dart';

class HttpHandler {
  static final _httpHandler=new HttpHandler();
  final String _baseUrl = "api.themoviedb.org"; // Define la URL base de la API.
  final String _language ="es-MX"; // Define el lenguaje deseado para las respuestas.

      static HttpHandler get(){
        return _httpHandler;
      }

  // Define una función asincrónica para obtener datos JSON desde una URI.
  Future<dynamic> getJson(Uri uri) async {
    http.Response response =
        await http.get(uri); // Realiza una solicitud GET HTTP.
    return json
        .decode(response.body); // Decodifica la respuesta JSON.
  }

  // Define una función para recuperar una lista de películas.
  Future<List<Media>> fetchMovies() {
    var uri = new Uri.https(
        _baseUrl,
        "3/movie/popular", // Crea una URI para obtener películas populares.
        {
          'api_key': API_KEY,
          'page': "1",
          'language': _language
        }); // Parámetros de la solicitud.
    // Llama a la función getJson para obtener datos y mapearlos en objetos de tipo Media.
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.movie)).toList()));
  }

Future<List<Media>> fetchShow() {
    var uri = new Uri.https(
        _baseUrl,
        "3/tv/popular", // Crea una URI para obtener películas populares.
        {
          'api_key': API_KEY,
          'page': "1",
          'language': _language
        }); // Parámetros de la solicitud.
    // Llama a la función getJson para obtener datos y mapearlos en objetos de tipo Media.
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.show)).toList()));
  }
}