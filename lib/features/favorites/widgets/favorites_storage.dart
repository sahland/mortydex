import 'dart:convert';
import 'package:mortydex/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  final SharedPreferences _prefs;
  static const _key = 'favorites';

  FavoritesStorage(this._prefs);

  List<CharacterModel> getFavorites() {
    final jsonString = _prefs.getString(_key);
    if (jsonString == null) return [];

    final decoded = json.decode(jsonString) as List<dynamic>;
    return decoded.map((e) => CharacterModel.fromJson(e)).toList();
  }

  Future<void> saveFavorites(List<CharacterModel> favorites) async {
    final jsonString = json.encode(favorites.map((c) => c.toJson()).toList());
    await _prefs.setString(_key, jsonString);
  }
}
