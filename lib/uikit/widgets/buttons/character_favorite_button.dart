import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacterFavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;

  const CharacterFavoriteButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });

  final String _starIcon = 'assets/icons/star.svg';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed ?? () {},
      icon: SvgPicture.asset(
        _starIcon,
        colorFilter: 
          isFavorite ? ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn) 
          : ColorFilter.mode(theme.colorScheme.secondary, BlendMode.srcIn),
        height: 24,
        width: 24,
      )
    );
  }
}