import 'package:flutter/material.dart';
import 'package:mortydex/uikit/uikit.dart';

class CharacterCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String status;
  final String species;
  final String location;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.species,
    required this.location,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildAvatar(),
            const SizedBox(width: 12.0),
            Expanded(
              child: _buildInfo(context),
            ),
            const SizedBox(width: 12.0),
            CharacterFavoriteButton(
              isFavorite: isFavorite,
              onPressed: onFavoriteToggle,
            ),
          ],
        )
      ),
    );
  }

  Widget _buildAvatar() {
    const width = 70.0;
    const height = 70.0;
    const borderRadius = 12.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const sizedBoxHeight = 4.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: sizedBoxHeight),
        _buildStatusAndSpecies(colorScheme),
        const SizedBox(height: sizedBoxHeight),
        _buildLocationInfo(theme)
      ],
    );
  }

  Widget _buildStatusAndSpecies(ColorScheme colorScheme) {
    final statusColor = switch (status.toLowerCase()) {
      'Живой' => Colors.green,
      'Умер' => Colors.red,
      _ => Colors.grey,
    };

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const TextSpan(
            text: ' • ',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: species,
            style: TextStyle(
              color: colorScheme.onSurface.withOpacity(0.7),
            )
          )
        ]
      )
    );
  }

  Widget _buildLocationInfo(ThemeData theme) {
    const lastLocaion = 'Местоположение: ';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lastLocaion,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          location,
          style: theme.textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}