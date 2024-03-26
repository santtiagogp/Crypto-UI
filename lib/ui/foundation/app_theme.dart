import 'package:flutter/material.dart';

class CryptoTheme {

  CryptoTheme._();

  static const Color primaryColor = Color.fromRGBO(167, 223, 138, 1);

  static const Color secondaryColor = Color.fromRGBO(23, 23, 23, 1);

  static final ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
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
  );

}