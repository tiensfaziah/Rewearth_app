import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6A9CFD);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF888888);
  static const Color lightGrey = Color(0xFFE1DFDF);
  static const Color greyOpacity = Color(0x87888888);
  static const Color background = Color(0xFFFFFFFF);
  static const Color gradientStart = Color(0xFF77A8FF);
  static const Color gradientEnd = Color(0xFF4F7FFF);
  static const Color shadowColor = Color(0x33000000); // Gunakan salah satu
  static const Color cardShadow = Color(0x25000000);
  static const Color transparent = Colors.transparent;

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [gradientStart, gradientEnd],
    stops: [0.0077, 0.9923],
  );
}
