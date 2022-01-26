import 'package:flutter/material.dart';

/// Group 11
/// Closes the details screen.
class CloseDetailsButton extends StatelessWidget {
  const CloseDetailsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          'X',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
