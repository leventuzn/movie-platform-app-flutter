import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_platform_app/theme.dart';
import 'package:overlay_support/overlay_support.dart';

/// Controller to handle taps. Works as tap debouncer.
class TapController extends ChangeNotifier {
  final Duration _getDetailsCooldown = const Duration(seconds: 1);
  final Duration _checkInternetCooldown = const Duration(seconds: 5);

  bool _isOnInternetCooldown = false;
  bool _isOnDetailsCooldown = false;

  get isOnInternetCooldown => _isOnInternetCooldown;
  get isOnDetailsCooldown => _isOnDetailsCooldown;

  void onDetailsTap() {
    _isOnDetailsCooldown = true;
    notifyListeners();
    _startDetailsDelay();
  }

  void onInternetTap() {
    _isOnInternetCooldown = true;
    showSimpleNotification(
      Text(
        'No internet connection',
        style: defaultAppTheme.textTheme.headline1,
      ),
      leading: const Icon(Icons.signal_cellular_nodata),
      background: const Color.fromRGBO(216, 54, 54, 1),
      position: NotificationPosition.bottom,
      duration: const Duration(seconds: 1),
    );
    notifyListeners();
    _startInternetDelay();
  }

  void _startDetailsDelay() {
    Future.delayed(_getDetailsCooldown).then((_) {
      _isOnDetailsCooldown = false;
      notifyListeners();
    });
  }

  void _startInternetDelay() {
    Future.delayed(_checkInternetCooldown).then((_) {
      _isOnInternetCooldown = false;
      notifyListeners();
    });
  }
}
