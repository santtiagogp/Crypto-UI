import 'package:flutter/material.dart';

class CryptoTheme {

  static final ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(167, 223, 138, 1),
      onPrimary: Color.fromRGBO(0, 0, 0, 1),
      secondary: Colors.transparent,
      onSecondary: Colors.transparent,
      error: Color.fromRGBO(163, 27, 27, 1),
      onError: Color.fromRGBO(0, 0, 0, 1),
      background: Color.fromRGBO(23, 23, 23, 1),
      onBackground: Color.fromRGBO(255, 255, 255, 1),
      surface: Color.fromRGBO(35, 37, 35, 1),
      onSurface: Color.fromRGBO(255, 255, 255, 1)
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      surfaceTintColor: Color.fromRGBO(23, 23, 23, 1)
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 30
      ),
      displayLarge: TextStyle(
        color: Color.fromRGBO(23, 23, 23, 1),
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w500
      )
    ),
  );

}