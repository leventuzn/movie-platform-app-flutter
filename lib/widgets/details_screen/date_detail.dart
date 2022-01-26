import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:provider/provider.dart';

/// Group 4
/// Displays release date of the movie or first air date of the tv show.
class DateDetail extends StatelessWidget {
  const DateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController _detailsController =
        Provider.of<DetailsController>(context);

    final String _date =
        _detailsController.currentContentType == ContentType.movie
            ? _detailsController.currentDetails.releaseDate
            : _detailsController.currentDetails.firstAirDate;
    final String _formattedDate = _date != ''
        ? DateFormat('dd.MM.yyyy').format(DateFormat('yyyy-MM-dd').parse(_date))
        : '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _detailsController.currentContentType == ContentType.movie
                ? 'Release Date'
                : 'First Air Date',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            _formattedDate,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
