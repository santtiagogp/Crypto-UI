import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {

  final void Function() onPressed;
  final double width;
  final double height;
  final String buttonText;

  const PageButton({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent)
      ),
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: theme.textTheme.displayMedium,
          ),
        ),
      )
    );
  }
}