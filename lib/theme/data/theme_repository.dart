import 'package:flutter/material.dart';
import 'package:mortydex/theme/theme.dart';

class ThemeRepository {
  final ThemeStorage _themeStorage;

  ThemeRepository({required ThemeStorage themeStorage})
      : _themeStorage = themeStorage;

  Future<void> setThemeMode(
    ThemeMode newThemeMode,
  ) async {
    await _themeStorage.saveThemeMode(mode: newThemeMode);
  }

  ThemeMode? getThemeMode() => _themeStorage.getThemeMode();
}
