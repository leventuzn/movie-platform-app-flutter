import 'package:movie_platform_app/models/details.dart';

/// This is a model class to manage tv show details data.
class TVShowDetails extends Details {
  final String name;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final String firstAirDate;

  TVShowDetails({
    overview,
    posterPath,
    voteAverage,
    required this.name,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.firstAirDate,
  }) : super(
          overview,
          posterPath,
          voteAverage,
        );

  factory TVShowDetails.fromJSON(Map<String, dynamic> json) {
    return TVShowDetails(
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      voteAverage: json['vote_average'],
      name: json['name'],
      numberOfSeasons: json['number_of_seasons'],
      numberOfEpisodes: json['number_of_episodes'],
      firstAirDate: json['first_air_date'] ?? '',
    );
  }
}
