import 'package:flutter/material.dart';

/// URL

//API Key (v3 auth)
const String apiKey = '?api_key=f3d0b625dc7b63acce86c3720063aaf1';

//API
const String baseUrl = 'https://api.themoviedb.org/3';

const String moviePath = '/movie';

const String tvPath = '/tv';

const String latestPath = '/latest';

const String popularPath = '/popular';

//Image
const String baseImageUrl = 'https://image.tmdb.org/t/p';

const String imageSizeSmall = '/w342';

const String imageSizeBig = '/w780';

/// UI
const Color appBackgroundColor = Color.fromRGBO(13, 13, 13, 1);

const List<Color> posterLinearGradient = [
  Color.fromRGBO(255, 255, 255, 0),
  Color.fromRGBO(0, 0, 0, 0.41),
  Color.fromRGBO(13, 13, 13, 1),
];

const SizedBox verticalSeperator = SizedBox(width: 20);
const SizedBox horizontalSeperator = SizedBox(height: 20);
