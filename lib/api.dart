import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_fsj/movie.dart';
import 'package:movies_fsj/tools/api_key.dart';

class Api {
  static String popularUrl(int page) =>
      "https://api.themoviedb.org/3/movie/popular?api_key=$key&page=$page";

  static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";

  static String movieUrl(String movieId) =>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$key";

  static Future<List<Movie>> getMovies(int page) async {
    http.Response response = await http.get(popularUrl(page));
    Map<String, dynamic> decoded = json.decode(response.body);
    List<dynamic> lista = decoded['results'];
    List<Movie> movies = lista.map((movie) {return Movie.fromJson(movie);}).toList();
    return movies;
  }
}
