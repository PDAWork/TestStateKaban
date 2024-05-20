import 'package:flutter/material.dart';

extension AppBuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TextThemeExtension on TextTheme {
  TextStyle get h1 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );
  TextStyle get h2 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  TextStyle get h3 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  TextStyle get h4 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  TextStyle get h5 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(
          0xFF85878E,
        ),
      );
  TextStyle get h6 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(
          0xFF1648D8,
        ),
      );
}
