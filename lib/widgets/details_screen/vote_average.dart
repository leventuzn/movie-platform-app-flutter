import 'package:flutter/material.dart';

/// Group 8
/// Displays vote average. Border color is set to corresponding color.
/// 0-4: red, 4-6: yellow, 6-8: orange, 8+: green
class VoteAverage extends StatelessWidget {
  const VoteAverage({Key? key, required this.voteAverage}) : super(key: key);

  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    Color _borderColor;
    if (voteAverage < 4) {
      _borderColor = Colors.red;
    } else if (voteAverage >= 4 && voteAverage < 6) {
      _borderColor = Colors.yellow;
    } else if (voteAverage >= 6 && voteAverage < 8) {
      _borderColor = Colors.orange;
    } else {
      _borderColor = Colors.green;
    }

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _borderColor),
      ),
      child: Center(
        child: Text(
          voteAverage.toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
