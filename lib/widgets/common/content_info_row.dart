import 'package:flutter/material.dart';
import 'package:movie_platform_app/widgets/home_screen/latest_content_title.dart';
import 'package:movie_platform_app/widgets/common/watch_button.dart';
import 'package:movie_platform_app/widgets/details_screen/title_detail.dart';

/// Group2
/// Holds the content title widget and the watch button in a row.
class ContentInfoRow extends StatelessWidget {
  const ContentInfoRow({Key? key, required this.isLatestContent})
      : super(key: key);

  final bool isLatestContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: isLatestContent
              ? const LatestContentTitle()
              : const TitleDetail(),
        ),
        const WatchButton(),
      ],
    );
  }
}
