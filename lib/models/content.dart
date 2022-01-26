import 'package:movie_platform_app/models/popular.dart';
import 'package:movie_platform_app/services/movie_service.dart';
import 'package:movie_platform_app/services/tv_service.dart';

// Available content types
enum ContentType { tv, movie }

// This is a model class to get information
// according to the type of the content.
class Content {
  ContentType contentType;
  String name;

  Content(this.contentType, this.name);

  factory Content.ofType(ContentType contentType) {
    if (contentType == ContentType.movie) {
      return Content(contentType, 'Movie');
    } else {
      return Content(contentType, 'TV Show');
    }
  }

  Future<List<Popular>> getPopulars(int page) {
    if (contentType == ContentType.movie) {
      return MovieService().getPopularMovies(page);
    } else {
      return TVService().getPopularTVShows(page);
    }
  }

  Future<dynamic> getDetails(int id) {
    if (contentType == ContentType.movie) {
      return MovieService().getDetails(id);
    } else {
      return TVService().getDetails(id);
    }
  }
}
