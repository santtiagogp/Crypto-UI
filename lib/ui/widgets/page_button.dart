import '../foundation/crypto_texts.dart';
import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {

  final void Function() onPressed;
  final String buttonText;
  final Color textColor;
  final Color? color;
  final double? width;
  final double? height;

  const PageButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.textColor,
    this.width,
    this.height,
    this.color
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
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1
                ).animate(animation),
                child: child,
              );
            },
            child: CryptoTexts.largeText(
              key: ValueKey<String>(buttonText),
              buttonText,
              color: textColor,
              fontWeight: FontWeight.w600
            ),
          )
        ),
      )
    );
    
  }
}