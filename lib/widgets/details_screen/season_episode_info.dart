import 'package:flutter/material.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:movie_platform_app/widgets/details_screen/seasons_detail.dart';
import 'package:movie_platform_app/widgets/details_screen/total_episodes_detail.dart';
import 'package:provider/provider.dart';

/// Group 5
/// Holds the season and total episode informations.
class SeasonEpisodeInfo extends StatelessWidget {
  const SeasonEpisodeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController _detailsController =
        Provider.of<DetailsController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SeasonsDetail(
            numberOfSeasons: _detailsController.currentDetails.numberOfSeasons,
          ),
          TotalEpisodesDetail(
            numberOfEpisodes:
                _detailsController.currentDetails.numberOfEpisodes,
          ),
        ],
      ),
    );
  }
}
