import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {

  final void Function() onPressed;
  final double width;
  final double height;

  const PageButton({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
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
        child: const Center(
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
    );
  }
}