import 'package:flutter/material.dart';

/// Group 6
/// Displays number of total episodes information of the tv show.
class TotalEpisodesDetail extends StatelessWidget {
  const TotalEpisodesDetail({Key? key, required this.numberOfEpisodes})
      : super(key: key);

  final int numberOfEpisodes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Total Episodes',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          numberOfEpisodes.toString(),
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
