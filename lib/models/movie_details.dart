import 'package:movie_platform_app/models/details.dart';

/// This is a model class to manage movie details data.
class MovieDetails extends Details {
  final String title;
  final String releaseDate;

  MovieDetails({
    overview,
    posterPath,
    voteAverage,
    required this.title,
    required this.releaseDate,
  }) : super(
          overview,
          posterPath,
          voteAverage,
        );

  factory MovieDetails.fromJSON(Map<String, dynamic> json) {
    return MovieDetails(
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: json['vote_average'],
      title: json['title'],
      releaseDate: json['release_date'],
    );
  }
}
