import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:movie_platform_app/models/latest.dart';
import 'package:movie_platform_app/models/latest_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_platform_app/models/latest_tv_show.dart';
import '../constants.dart';

/// This is a service class to get latest content information.
class LatestService {
  Future<Latest> getLatest() async {
    var latestMovie = getLatestMovie();
    var latestTVShow = getLatestTVShow();
    var latestMovieDate = DateTime.utc(0);
    var latestTVShowDate = DateTime.utc(0);
    await latestMovie.then((movie) {
      if (movie.date.isNotEmpty) {
        latestMovieDate = DateFormat('yyyy-MM-dd').parse(movie.date);
      }
    });
    await latestTVShow.then((tv) {
      if (tv.date.isNotEmpty) {
        latestTVShowDate = DateFormat('yyyy-MM-dd').parse(tv.date);
      }
    });

    return latestMovieDate.isAfter(latestTVShowDate)
        ? latestMovie
        : latestTVShow;
  }

  Future<LatestMovie> getLatestMovie() async {
    final response =
        await http.get(Uri.parse(baseUrl + moviePath + latestPath + apiKey));
    if (response.statusCode == 200) {
      return LatestMovie.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<LatestTVShow> getLatestTVShow() async {
    final response =
        await http.get(Uri.parse(baseUrl + tvPath + latestPath + apiKey));
    if (response.statusCode == 200) {
      return LatestTVShow.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
