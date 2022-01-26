import 'dart:convert';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/popular.dart';
import 'package:http/http.dart' as http;
import 'package:movie_platform_app/models/tv_show_details.dart';

import '../constants.dart';

/// This is a service class to get popular tv shows
/// and to get details of the tv show by id.
class TVService {
  Future<List<Popular>> getPopularTVShows(int page) async {
    final response = await http.get(
        Uri.parse(baseUrl + tvPath + popularPath + apiKey + '&page=$page'));
    if (response.statusCode == 200) {
      List<Popular> popularTVShows = [];
      var popularTVShowsJSON = jsonDecode(response.body);
      for (Map<String, dynamic> tvShow in popularTVShowsJSON['results']) {
        popularTVShows.add(Popular.fromJSON(tvShow, ContentType.tv));
      }
      return popularTVShows;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<TVShowDetails> getDetails(int id) async {
    final response =
        await http.get(Uri.parse(baseUrl + tvPath + '/$id' + apiKey));
    if (response.statusCode == 200) {
      return TVShowDetails.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
