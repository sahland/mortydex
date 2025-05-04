import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const AppBarTitle({
    super.key,
    required this.title,
    this.fontSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
