import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mortydex/data/data.dart';
import 'package:mortydex/mortydex_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/favorites/favorites.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final prefs = await SharedPreferences.getInstance();
  final charactersCache = CharactersCache(prefs);
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themeStorage: themeStorage);
  final themeController = ThemeController(themeRepository: themeRepository);
  final favoritesStorage = FavoritesStorage(prefs);

  runApp(
    MortydexApp(
      themeController: themeController,
      favoritesStorage: favoritesStorage,
      charactersCache: charactersCache,
    ),
  );
}
