import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/movie_details.dart';
import 'package:movie_platform_app/models/popular.dart';

import '../constants.dart';

/// This is a service class to get popular movies
/// and to get details of the movie by id.
class MovieService {
  Future<List<Popular>> getPopularMovies(int page) async {
    final response = await http.get(
        Uri.parse(baseUrl + moviePath + popularPath + apiKey + '&page=$page'));
    if (response.statusCode == 200) {
      List<Popular> popularMovies = [];
      var popularMoviesJSON = jsonDecode(response.body);
      for (Map<String, dynamic> movie in popularMoviesJSON['results']) {
        popularMovies.add(Popular.fromJSON(movie, ContentType.movie));
      }
      return popularMovies;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieDetails> getDetails(int id) async {
    final response =
        await http.get(Uri.parse(baseUrl + moviePath + '/$id' + apiKey));
    if (response.statusCode == 200) {
      return MovieDetails.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
