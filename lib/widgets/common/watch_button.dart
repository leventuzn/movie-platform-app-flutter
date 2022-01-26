import 'package:flutter/material.dart';

/// Clickable button with no action
class WatchButton extends StatelessWidget {
  const WatchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.67,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Watch'),
      ),
    );
  }
}
