import 'package:flutter/material.dart';

/// Group 7
/// Displays number of seasons information of the tv show.
class SeasonsDetail extends StatelessWidget {
  const SeasonsDetail({Key? key, required this.numberOfSeasons})
      : super(key: key);

  final int numberOfSeasons;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seasons',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          numberOfSeasons.toString(),
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
