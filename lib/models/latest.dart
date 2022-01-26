import 'content.dart';

/// This is the base class of the latest content model.
class Latest {
  final int id;
  final String name;
  final String posterPath;
  final String date;
  final ContentType contentType;

  Latest(this.id, this.name, this.posterPath, this.date, this.contentType);
}
