import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mortydex/features/characters/bloc/bloc.dart';
import 'package:mortydex/features/favorites/favorites.dart';
import 'package:mortydex/uikit/uikit.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  final String title = 'Characters';
  final double appBarHeight = 70.0;
  final double appBarElevation = 80.0;

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  Timer? _networkTimeoutTimer;
  bool _didShowNetworkError = false;

  @override
  void initState() {
    super.initState();

    _startNetworkTimeout();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharactersBloc>().add(const CharactersRequestedEvent());
    });
  }

  void _startNetworkTimeout() {
    _networkTimeoutTimer?.cancel();

    _networkTimeoutTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && !_didShowNetworkError) {
        _didShowNetworkError = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Network connectivity problems...'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 4),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _networkTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (!_didShowNetworkError && state is CharactersResponseLoadedState) {
          _networkTimeoutTimer?.cancel();
        }

        return RefreshIndicator(
          onRefresh: () => _refreshScreen(context),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              _buildSliverAppBar(theme),
              if (state is CharactersLoadingState) _buildLoading(theme),
              if (state is CharactersResponseLoadedState)
                _buildCharactersList(state),
              if (state is CharactersErrorState)
                _buildError(state.message, theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSliverAppBar(ThemeData theme) {
    return SliverAppBar(
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
    );
  }

  Widget _buildLoading(ThemeData theme) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildCharactersList(CharactersResponseLoadedState state) {
    return SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) {
      final character = state.characters[index];
      return AnimatedCharacterCard(
        index: index,
        child: CharacterCard(
          imageUrl: character.image,
          name: character.name,
          status: character.status,
          species: character.species,
          location: character.location.name,
          isFavorite: context.watch<FavoritesCubit>().isFavorite(character),
          onFavoriteToggle: () {
            context.read<FavoritesCubit>().toggleFavorite(character);
          },
        ),
      );
    },
    childCount: state.characters.length,
  ),
);

  }

  Widget _buildError(String message, ThemeData theme) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          'Error: $message',
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final completer = Completer();

    context.read<CharactersBloc>().add(
          CharactersRequestedEvent(completer: completer),
        );

    await completer.future;
  }
}
