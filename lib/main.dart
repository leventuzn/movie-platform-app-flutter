import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:movie_platform_app/models/tap_controller.dart';
import 'package:movie_platform_app/services/latest_service.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'models/latest.dart';
import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LatestService _latestService = LatestService();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DetailsController(),
          ),
          ChangeNotifierProvider(
            create: (_) => TapController(),
          ),
          FutureProvider<Latest?>(
            create: (_) => _latestService.getLatest(),
            initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'Movie Platform',
          theme: defaultAppTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/details': (context) => const DetailsScreen(),
          },
        ),
      ),
    );
  }
}
