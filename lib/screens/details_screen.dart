import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_platform_app/constants.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:movie_platform_app/models/tap_controller.dart';
import 'package:movie_platform_app/widgets/details_screen/close_details_button.dart';
import 'package:movie_platform_app/widgets/details_screen/date_detail.dart';
import 'package:movie_platform_app/widgets/details_screen/description.dart';
import 'package:movie_platform_app/widgets/details_screen/season_episode_info.dart';
import 'package:movie_platform_app/widgets/details_screen/vote_average.dart';
import 'package:movie_platform_app/widgets/common/content_info_row.dart';
import 'package:movie_platform_app/widgets/common/content_poster.dart';
import 'package:provider/provider.dart';

/// This is the details screen that displays the content details.
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsController _detailsController;
  late TapController _tapController;
  bool _hasInternet = false;

  @override
  void initState() {
    super.initState();
    _detailsController = Provider.of<DetailsController>(context, listen: false);
    _tapController = Provider.of<TapController>(context, listen: false);

    InternetConnectionChecker().hasConnection.then((isConnected) {
      if (isConnected) {
        Content.ofType(_detailsController.currentContentType)
            .getDetails(_detailsController.currentContentId)
            .then(
          (details) {
            setState(() {
              _hasInternet = true;
              _detailsController.setCurrentDetails(details);
            });
          },
        );
      } else {
        InternetConnectionChecker().onStatusChange.listen((status) {
          if (status == InternetConnectionStatus.connected && !_hasInternet) {
            Content.ofType(_detailsController.currentContentType)
                .getDetails(_detailsController.currentContentId)
                .then(
              (details) {
                setState(() {
                  _hasInternet = true;
                  _detailsController.setCurrentDetails(details);
                });
              },
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          color: appBackgroundColor,
          child: _detailsController.currentDetails != null
              ? ListView(
                  children: [
                    Stack(
                      children: [
                        ContentPoster(
                          posterPath: _detailsController.currentPosterPath,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 60, right: 20, top: 284),
                          child: ContentInfoRow(isLatestContent: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 289),
                          child: VoteAverage(
                              voteAverage: _detailsController
                                  .currentDetails.voteAverage),
                        ),
                        const Positioned(
                          top: 30,
                          right: 20,
                          child: CloseDetailsButton(),
                        ),
                      ],
                    ),
                    horizontalSeperator,
                    if (_detailsController.currentContentType == ContentType.tv)
                      const SeasonEpisodeInfo(),
                    if (_detailsController.currentContentType == ContentType.tv)
                      horizontalSeperator,
                    const DateDetail(),
                    horizontalSeperator,
                    Description(
                        description:
                            _detailsController.currentDetails.overview),
                    horizontalSeperator,
                  ],
                )
              : InkWell(
                  onTap: () {
                    if (!_tapController.isOnInternetCooldown) {
                      _tapController.onInternetTap();
                    }
                  },
                  child: const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.grey,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
