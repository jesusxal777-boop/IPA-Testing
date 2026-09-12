import 'package:flutter/material.dart';

class DreamByteTheme {
  // Colors
  static const Color navyDark = Color(0xFF0A1428);
  static const Color navyMedium = Color(0xFF1A2F4F);
  static const Color electricBlue = Color(0xFF0066FF);
  static const Color cyanNeon = Color(0xFF00D9FF);
  static const Color cyberGray = Color(0xFF2D3E50);
  static const Color glassLight = Color(0xFFE8F4FF);
  static const Color white = Color(0xFFFFFFFF);

  // Gradient
  static const LinearGradient blueGradient = LinearGradient(
    colors: [electricBlue, cyanNeon],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: electricBlue,
      scaffoldBackgroundColor: navyDark,
      colorScheme: const ColorScheme.dark(
        primary: electricBlue,
        secondary: cyanNeon,
        tertiary: cyberGray,
        surface: navyMedium,
        background: navyDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: navyMedium.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: navyMedium.withOpacity(0.6),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: navyMedium.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cyanNeon, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: cyanNeon.withOpacity(0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cyanNeon, width: 2),
        ),
        hintStyle: TextStyle(color: white.withOpacity(0.5)),
        prefixIconColor: cyanNeon,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: electricBlue,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: white,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: white,
          fontSize: 14,
        ),
        labelLarge: TextStyle(
          color: electricBlue,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
