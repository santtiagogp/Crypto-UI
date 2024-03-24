import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {

  const SkipButton({
    super.key,
    required this.onPressed
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {

    return TextButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.grey)
      ),
      onPressed: onPressed,
      child: const Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}