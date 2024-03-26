import 'package:crypto_ui/ui/foundation/app_theme.dart';
import 'package:crypto_ui/ui/foundation/crypto_texts.dart';
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
          child: CryptoTexts.largeText(
            buttonText,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
      )
    );
  }
}