import 'package:flutter/material.dart';

/// Brand colours: dark navy, white, gold.
class Brand {
  static const navy = Color(0xFF0B1F3A);
  static const navyLight = Color(0xFF14305A);
  static const navyCard = Color(0xFF112A4D);
  static const gold = Color(0xFFC9A227);
  static const goldSoft = Color(0xFFE3C766);
  static const white = Color(0xFFFFFFFF);
  static const muted = Color(0xFFB8C2D4);
}

ThemeData buildTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: Brand.gold,
    brightness: Brightness.dark,
  ).copyWith(
    primary: Brand.gold,
    onPrimary: Brand.navy,
    secondary: Brand.goldSoft,
    surface: Brand.navy,
    onSurface: Brand.white,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: Brand.navy,
    appBarTheme: const AppBarTheme(
      backgroundColor: Brand.navy,
      foregroundColor: Brand.white,
      elevation: 0,
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Brand.navyLight,
      indicatorColor: Brand.gold.withValues(alpha: 0.25),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 11, color: Brand.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Brand.navyCard,
      hintStyle: const TextStyle(color: Brand.muted),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
    ),
  );
}
