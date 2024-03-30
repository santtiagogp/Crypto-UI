import 'package:flutter/material.dart';

class CryptoChip extends StatelessWidget {

  final String text;

  const CryptoChip({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: const TextStyle(
        color: Colors.white,
        fontSize: 15
      ),),
      backgroundColor: const Color.fromRGBO(35, 37, 35, 1),
      shape: const StadiumBorder(),
    );
  }
}