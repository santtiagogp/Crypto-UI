import 'package:crypto_ui/ui/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/pages/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('first_time', true);
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTCash',
      debugShowCheckedModeBanner: false,
      theme: CryptoTheme.appTheme,
      home: const OnboardingScreen(),
    );
  }
}