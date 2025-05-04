import 'package:flutter/material.dart';
import 'package:mortydex/uikit/uikit.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  final String title = 'Персонажи';
  final double appBarHeight = 70.0;
  final double appBarElevation = 80.0;

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
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
          actions: [
            ThemeButton(),
            ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => CharacterCard(
              imageUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
              name: 'Рик Санчез',
              status: 'Живой',
              species: 'Человек',
              location: 'Earth (C-137)',
              isFavorite: false,
              onFavoriteToggle: () {},
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
