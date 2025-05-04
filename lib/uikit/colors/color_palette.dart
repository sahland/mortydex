import 'package:flutter/material.dart';

abstract class LightColorPalette {
  static const white = Colors.white;
  static const black = Colors.black;
  static const lightScaffold = Color(0xFFF4F4F4);
  static const lightBar = Color(0xFFFFFFFF);
  static const blackElement = Color(0xFF2D3035);
  static const textGray = Color(0xFF9395A8);
  static const lightPrimary = Color(0xFF8364FF);
}

abstract class DarkColorPalette {
  static const white = Colors.white;
  static const black = Colors.black;
  static const darkScaffold = Color(0xFF101014);
  static const darkBar = Color(0xFF191B1D);
  static const whiteElement = Color(0xFFFFFFFF);
  static const textGray = Color(0xFF9395A8);
  static const darkPrimary = Color(0xFF70A8FF);
}
