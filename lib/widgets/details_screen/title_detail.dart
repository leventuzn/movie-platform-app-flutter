import 'package:flutter/material.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:provider/provider.dart';

/// Group 9-10
/// Displays title and type information of the content.
class TitleDetail extends StatelessWidget {
  const TitleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController _detailsController =
        Provider.of<DetailsController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _detailsController.currentContentType == ContentType.movie
              ? _detailsController.currentDetails.title
              : _detailsController.currentDetails.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          Content.ofType(_detailsController.currentContentType).name,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
