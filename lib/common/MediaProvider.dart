import 'dart:async';
import 'package:practica8_200570/Model/Media.dart';
import 'package:practica8_200570/common/HttpHandler.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia();
}
class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchMovies();
  }
}
class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchShow();
  }

}