import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';

/// Group 1
/// Displays the poster of the content.
/// It shows a placeholder if the poster path is null.
class ContentPoster extends StatelessWidget {
  const ContentPoster({Key? key, required this.posterPath}) : super(key: key);

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 342,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: -38,
            child: posterPath != ''
                ? CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                    imageUrl: baseImageUrl + imageSizeBig + posterPath,
                    placeholder: (context, url) => const SpinKitCircle(
                      color: Colors.grey,
                    ),
                  )
                : Image.asset(
                    'assets/poster-placeholder.jpg',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: -39,
            child: Container(
              height: 380,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: posterLinearGradient,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
