import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Color.fromRGBO(138, 135, 138, 1)
        ),
        prefixIconColor: const Color.fromRGBO(138, 135, 138, 1),
        prefixIcon: const Icon(Icons.search, size: 30,),
        hintText: 'Example: Debtcoin',
        fillColor: const Color.fromRGBO(35, 37, 35, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40)
        )
      ),
    );
  }
}