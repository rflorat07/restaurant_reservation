import 'package:flutter/material.dart';

class TColors {
  TColors._();
  // App Basic Colors
  static const Color primary = Color(0xFF5B4CBD);
  static const Color secondary = Color(0xFFE24701);
  static const Color tertiary = Color(0xFF242424);
  static const Color quaternary = Color(0xFF797979);
  static const Color quinary = Color(0xFFF6F6F6);

  // Text Colors
  static const Color textPrimary = Color(0xFF5B4CBD);
  static const Color textSecondary = Color(0xFF797979);
  static const Color textWhite = Color(0xFFF6F6F6);

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF242424);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Colors.white;
  static Color darkContainer = Colors.white.withValues(alpha: 0.1);

  // Border Colors
  static const Color borderPrimary = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color borderSecondary = Color(0xFF4C9580);

  // Divider Color
  static const Color dividerColor = Color.fromRGBO(0, 0, 0, 0.1);

  // Error an Validation Colors
  static const Color error = Color(0xFFFF0A0A);
  static const Color success = Color(0xFF4C9580);
  static const Color warning = Color(0xFFFCBB44);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades Colors
  static const Color black = Color(0xFF242424);
  static const Color darkerGrey = Color(0xFF797979);
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow = Color(0xFFFFD542);
  static const Color starYellow = Color(0xFFFCBB44);
  static const Color whiteSmoke = Color(0xFFF6F6F6);
  static const Color lightSilver = Color(0xFFD9D9D9);
  static const Color davyGrey = Color(0xFF5A5A5A);
  static const Color seaGreen = Color(0xFF25bc5f);
}
