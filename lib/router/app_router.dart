import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mortydex/features/characters/characters.dart';
import 'package:mortydex/features/favorites/favorites.dart';
import 'package:mortydex/features/root/root.dart';
import 'package:mortydex/router/router.dart';

class AppRouter {
  static final _rootNavigationKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigationKey,
    initialLocation: '/characters',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: PAGES.characters.screenPath,
                name: PAGES.characters.name,
                builder: (context, state) => const CharactersPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: PAGES.favorites.screenPath,
                name: PAGES.favorites.screenName,
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
