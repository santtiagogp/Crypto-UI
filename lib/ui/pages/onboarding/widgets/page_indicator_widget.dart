import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.isCurrentItem
  });

  final bool isCurrentItem;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isCurrentItem ? 40 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCurrentItem ? Colors.black : Colors.grey[300],
      ),
    );
  }
}