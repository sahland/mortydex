import 'dart:convert';

import 'package:mortydex/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharactersCache {
  final SharedPreferences _prefs;
  static const _key = 'cached_characters';

  CharactersCache(this._prefs);

  Future<void> save(List<CharacterModel> characters) async {
    final jsonString = json.encode(characters.map((e) => e.toJson()).toList());
    await _prefs.setString(_key, jsonString);
  }

  List<CharacterModel> load() {
    final jsonString = _prefs.getString(_key);
    if (jsonString == null) return [];

    final decoded = json.decode(jsonString) as List;
    return decoded.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
