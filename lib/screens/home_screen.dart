import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_platform_app/constants.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/tap_controller.dart';
import 'package:movie_platform_app/widgets/home_screen/latest_content.dart';
import 'package:movie_platform_app/widgets/home_screen/popular_list.dart';
import 'package:provider/provider.dart';

/// This is the home screen of the app.
/// Displays latest content and lists of popular contents.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _internetSubscription;
  final ScrollController _controller = ScrollController();
  late TapController _tapController;
  bool _hasInternet = false;

  @override
  void initState() {
    super.initState();
    _tapController = Provider.of<TapController>(context, listen: false);
    _internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected && !_hasInternet) {
        setState(() {
          _hasInternet = true;
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          });
        });
      } else {
        _hasInternet = false;
        if (!_tapController.isOnInternetCooldown) {
          _tapController.onInternetTap();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _internetSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          color: appBackgroundColor,
          child: _hasInternet
              ? ListView(
                  controller: _controller,
                  children: [
                    const LatestContent(),
                    PopularList(contentType: ContentType.tv),
                    PopularList(contentType: ContentType.movie),
                    const SizedBox(height: 30),
                  ],
                )
              : const Center(
                  child: SpinKitWave(
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
