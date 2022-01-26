import 'package:flutter/cupertino.dart';
import 'package:movie_platform_app/models/content.dart';

/// This is a notifier class for details to provide
/// details of the selected content to the listeners.
class DetailsController extends ChangeNotifier {
  late ContentType _currentContentType;
  late int _currentContentId;
  late String _currentPosterPath;
  dynamic _currentDetails;

  get currentContentType => _currentContentType;
  get currentContentId => _currentContentId;
  get currentPosterPath => _currentPosterPath;
  get currentDetails => _currentDetails;

  setCurrent(ContentType contentType, int id, String posterPath) {
    _currentContentType = contentType;
    _currentContentId = id;
    _currentPosterPath = posterPath;
    notifyListeners();
  }

  setCurrentDetails(dynamic details) {
    if (_currentPosterPath == '') {
      _currentPosterPath = details.posterPath;
    }
    _currentDetails = details;
    notifyListeners();
  }

  clearCurrentDetails() {
    _currentDetails = null;
  }
}
