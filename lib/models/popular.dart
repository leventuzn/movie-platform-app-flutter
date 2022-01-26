import 'package:movie_platform_app/models/content.dart';

/// This is a model class to manage popular content data.
class Popular {
  final int id;
  final String posterPath;
  final ContentType contentType;

  Popular(
      {required this.id, required this.posterPath, required this.contentType});

  factory Popular.fromJSON(Map<String, dynamic> json, ContentType contentType) {
    return Popular(
      id: json['id'],
      posterPath: json['poster_path'] ?? '',
      contentType: contentType,
    );
  }
}
