import 'package:movie_platform_app/models/latest.dart';

import 'content.dart';

/// This is a model class to manage latest tv show data.
class LatestTVShow extends Latest {
  LatestTVShow({
    id,
    name,
    posterPath,
    firstAirDate,
    contentType,
  }) : super(
          id,
          name,
          posterPath,
          firstAirDate,
          contentType,
        );

  factory LatestTVShow.fromJSON(Map<String, dynamic> json) {
    return LatestTVShow(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      contentType: ContentType.tv,
    );
  }
}
