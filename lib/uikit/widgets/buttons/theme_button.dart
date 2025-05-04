import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mortydex/theme/theme.dart';

class ThemeButton extends StatelessWidget {
  final double width;
  final double height;

  const ThemeButton({
    this.width = 25,
    this.height = 25,
    super.key,
  });

  static const String _moonIcon = 'assets/icons/moon.svg';
  static const String _sunIcon = 'assets/icons/sun.svg';

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeInherited.of(context);
    final theme = Theme.of(context);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController.themeMode,
      builder: (context, themeMode, _) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            minimumSize: Size(width, height),
          ),
          onPressed: () => themeController.switchThemeMode(),
          child: SvgPicture.asset(
            themeMode == ThemeMode.dark ? _moonIcon : _sunIcon,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
