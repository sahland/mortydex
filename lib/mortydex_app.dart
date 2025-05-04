import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mortydex/data/data.dart';
import 'package:mortydex/features/characters/bloc/bloc.dart';
import 'package:mortydex/features/favorites/favorites.dart';
import 'package:mortydex/router/router.dart';
import 'package:mortydex/uikit/uikit.dart';

import 'theme/theme.dart';

class MortydexApp extends StatefulWidget {
  const MortydexApp({
    super.key,
    required this.themeController,
    required this.favoritesStorage,
    required this.charactersCache,
  });

  final ThemeController themeController;
  final FavoritesStorage favoritesStorage;
  final CharactersCache charactersCache;

  @override
  State<MortydexApp> createState() => _MortydexAppState();
}

class _MortydexAppState extends State<MortydexApp> {
  late final CharactersListApiClient characterApiClient;

  @override
  void initState() {
    super.initState();
    characterApiClient = CharactersListApiClient(
      Dio(),
      baseUrl: dotenv.env['API_URL'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharactersBloc(
            charactersApiClient: characterApiClient,
            charactersCache: widget.charactersCache,
          ),
        ),
        BlocProvider(
          create: (_) => FavoritesCubit(widget.favoritesStorage),
        ),
      ],
      child: ThemeInherited(
        themeController: widget.themeController,
        child: ThemeBuilder(
          builder: (_, themeMode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Mortydex',
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: themeMode,
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routerDelegate: AppRouter.router.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
