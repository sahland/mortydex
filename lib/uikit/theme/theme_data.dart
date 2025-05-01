import 'package:flutter/material.dart';
import 'package:mortydex/uikit/uikit.dart';

abstract class AppThemeData {
  static const _lightColorScheme = AppColorScheme.light();
  static const _darkColorScheme = AppColorScheme.dark();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    extensions:  const [_lightColorScheme],
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _lightColorScheme.primary,
      secondary: _lightColorScheme.secondary,
      surface: _lightColorScheme.surface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.surface,
      foregroundColor: _lightColorScheme.secondary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _lightColorScheme.textField),
      bodyMedium: TextStyle(color: _lightColorScheme.grayTextField),
    ),
  );

  static final darkThem = ThemeData(
    useMaterial3: true,
    extensions: const [_darkColorScheme],
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _darkColorScheme.primary,
      secondary: _darkColorScheme.secondary,
      surface: _darkColorScheme.surface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.surface,
      foregroundColor: _darkColorScheme.secondary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _darkColorScheme.textField),
      bodyMedium: TextStyle(color: _darkColorScheme.grayTextField),
    ),
  );
}