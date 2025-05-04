import 'package:flutter/material.dart';
import 'package:mortydex/uikit/uikit.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color secondary;
  final Color surface;
  final Color background;
  final Color textField;
  final Color grayTextField;
  final Color dialogBackground;

  const AppColorScheme._({
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.background,
    required this.textField,
    required this.grayTextField,
    required this.dialogBackground,
  });

  const AppColorScheme.light()
      : this._(
          primary: LightColorPalette.lightPrimary,
          secondary: LightColorPalette.blackElement,
          surface: LightColorPalette.lightBar,
          background: LightColorPalette.lightScaffold,
          textField: LightColorPalette.blackElement,
          grayTextField: LightColorPalette.textGray,
          dialogBackground: LightColorPalette.lightBar,
        );

  const AppColorScheme.dark()
      : this._(
          primary: DarkColorPalette.darkPrimary,
          secondary: DarkColorPalette.whiteElement,
          surface: DarkColorPalette.darkBar,
          background: DarkColorPalette.darkScaffold,
          textField: DarkColorPalette.whiteElement,
          grayTextField: DarkColorPalette.textGray,
          dialogBackground: DarkColorPalette.darkBar,
        );

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? surface,
    Color? background,
    Color? textField,
    Color? grayTextField,
    Color? dialogBackground,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      textField: textField ?? this.textField,
      grayTextField: grayTextField ?? this.grayTextField,
      dialogBackground: dialogBackground ?? this.dialogBackground,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      grayTextField: Color.lerp(grayTextField, other.grayTextField, t)!,
      dialogBackground:
          Color.lerp(dialogBackground, other.dialogBackground, t)!,
    );
  }

  static AppColorScheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorScheme>()!;
  }
}
