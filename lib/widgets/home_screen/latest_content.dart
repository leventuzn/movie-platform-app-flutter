import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:movie_platform_app/models/latest.dart';
import 'package:movie_platform_app/models/tap_controller.dart';
import 'package:movie_platform_app/screens/details_screen.dart';
import 'package:movie_platform_app/widgets/common/content_info_row.dart';
import 'package:movie_platform_app/widgets/common/content_poster.dart';
import 'package:movie_platform_app/widgets/custom_page_route.dart';
import 'package:provider/provider.dart';

/// This is a featured and latest added content.
/// It navigates to content details on click.
class LatestContent extends StatelessWidget {
  const LatestContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController _detailsController =
        Provider.of<DetailsController>(context);
    final TapController _tapController =
        Provider.of<TapController>(context, listen: false);
    final Latest? _latest = Provider.of<Latest?>(context);

    return _latest == null
        ? const SizedBox(
            height: 342,
            child: Center(
              child: SpinKitCircle(
                color: Colors.grey,
              ),
            ),
          )
        : InkWell(
            onTap: () {
              if (!_tapController.isOnDetailsCooldown) {
                _tapController.onDetailsTap();
                _detailsController.setCurrent(
                    _latest.contentType, _latest.id, _latest.posterPath);
                _detailsController.clearCurrentDetails();
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: const DetailsScreen(),
                  ),
                );
              }
            },
            child: Stack(
              children: [
                ContentPoster(posterPath: _latest.posterPath),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 278),
                  child: ContentInfoRow(isLatestContent: true),
                ),
              ],
            ),
          );
  }
}
