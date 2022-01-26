import 'package:flutter/material.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/latest.dart';
import 'package:provider/provider.dart';

/// Group 12
/// Displays the title and the type information of the latest added content.
class LatestContentTitle extends StatelessWidget {
  const LatestContentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Latest? _latest = Provider.of<Latest?>(context);

    return _latest == null
        ? const CircularProgressIndicator()
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _latest.name,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                Content.ofType(_latest.contentType).name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Latest content',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          );
  }
}
