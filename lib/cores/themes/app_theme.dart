import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFFFF7A00);
  static const Color secondaryLight = Color(0xFFE65100);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color scaffoldLight = Color(0xFFFAFAFA);
  static const Color errorLight = Color(0xFFD32F2F);

  static const Color primaryDark = Color(0xFF4D88FF);
  static const Color secondaryDark = Color(0xFFFFB366);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color scaffoldDark = Color(0xFF1E1E1E);
  static const Color errorDark = Color(0xFFEF5350);

  static ThemeData get ligthTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: scaffoldLight,
      colorScheme: ColorScheme.light(
        primary: primaryLight,
        secondary: secondaryLight,
        surface: surfaceLight,
        surfaceContainerHighest: scaffoldLight,
        error: errorLight,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: primaryLight,
        ),
         headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28
        ),

        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14
        ),
        bodyMedium: TextStyle(
           fontWeight: FontWeight.w400,
          fontSize: 12
        ),
        bodySmall: TextStyle(
           fontWeight: FontWeight.w300,
          fontSize: 11
        )
      ),
      badgeTheme: BadgeThemeData(backgroundColor: secondaryLight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryLight,
        unselectedItemColor: scaffoldDark
      ),
      
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: scaffoldDark,
      colorScheme: ColorScheme.dark(
        primary: primaryDark,
        secondary: secondaryDark,
        surface: surfaceDark,
        error: errorDark,
      ),
    );
  }
}
