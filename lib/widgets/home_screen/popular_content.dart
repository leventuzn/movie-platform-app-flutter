import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_platform_app/models/details_controller.dart';
import 'package:movie_platform_app/models/popular.dart';
import 'package:movie_platform_app/models/tap_controller.dart';
import 'package:movie_platform_app/screens/details_screen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../custom_page_route.dart';

/// Displays poster of the content in a clickable widget.
/// It navigates to content details on click.
/// It shows a placeholder if the poster path is null.
class PopularContent extends StatelessWidget {
  const PopularContent({Key? key, required this.popular}) : super(key: key);

  final Popular popular;

  @override
  Widget build(BuildContext context) {
    final DetailsController _detailsController =
        Provider.of<DetailsController>(context, listen: false);
    final TapController _tapController =
        Provider.of<TapController>(context, listen: false);
    String imageUrl = baseImageUrl + imageSizeSmall + popular.posterPath;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 150,
        height: 225,
        child: Card(
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              if (!_tapController.isOnDetailsCooldown) {
                _tapController.onDetailsTap();
                _detailsController.setCurrent(
                    popular.contentType, popular.id, popular.posterPath);
                _detailsController.clearCurrentDetails();
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: const DetailsScreen(),
                  ),
                );
              }
            },
            child: popular.posterPath != ''
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    cacheKey: popular.posterPath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const LinearProgressIndicator(
                      backgroundColor: Colors.black12,
                      color: Colors.black,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.asset(
                    'assets/poster-placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
