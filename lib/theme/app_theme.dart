import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.light,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.dark,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: _lightColorScheme.primaryContainer,
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: _lightColorScheme.onSurface,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColorScheme.primary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColorScheme.outline,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: _darkColorScheme.surface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: _darkColorScheme.primaryContainer,
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: _darkColorScheme.onSurface,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColorScheme.primary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColorScheme.outline,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    ),
  );
}
