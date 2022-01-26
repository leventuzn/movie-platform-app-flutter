import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/latest.dart';

/// This is a model class to manage latest movie data.
class LatestMovie extends Latest {
  LatestMovie({
    id,
    name,
    posterPath,
    releaseDate,
    contentType,
  }) : super(
          id,
          name,
          posterPath,
          releaseDate,
          contentType,
        );

  factory LatestMovie.fromJSON(Map<String, dynamic> json) {
    return LatestMovie(
      id: json['id'],
      name: json['title'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      contentType: ContentType.movie,
    );
  }
}
