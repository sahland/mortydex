import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mortydex/domain/domain.dart';
import 'package:mortydex/features/favorites/favorites.dart';
import 'package:mortydex/uikit/uikit.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  final String title = 'Favorites';
  final double appBarHeight = 70.0;
  final double appBarElevation = 80.0;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          centerTitle: true,
          floating: true,
          snap: true,
          toolbarHeight: widget.appBarHeight,
          elevation: widget.appBarElevation,
          backgroundColor: theme.cardColor,
          surfaceTintColor: theme.cardColor,
          title: AppBarTitle(title: widget.title),
          actions: const [ThemeButton()],
        ),
        BlocBuilder<FavoritesCubit, List<CharacterModel>>(
          builder: (context, favorites) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final character = favorites[index];
                  return AnimatedCharacterCard(
                    index: index,
                    child: CharacterCard(
                      imageUrl: character.image,
                      name: character.name,
                      status: character.status,
                      species: character.species,
                      location: character.location.name,
                      isFavorite: true,
                      onFavoriteToggle: () {
                        context
                            .read<FavoritesCubit>()
                            .toggleFavorite(character);
                      },
                    ),
                  );
                },
                childCount: favorites.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
