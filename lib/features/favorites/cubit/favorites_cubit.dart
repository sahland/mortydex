import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mortydex/domain/domain.dart';
import 'package:mortydex/features/favorites/favorites.dart';

class FavoritesCubit extends Cubit<List<CharacterModel>> {
  final FavoritesStorage _storage;

  FavoritesCubit(this._storage) : super([]) {
    loadFavorites();
  }

  void loadFavorites() {
    emit(_storage.getFavorites());
  }

  void toggleFavorite(CharacterModel character) {
    final isAlready = state.any((c) => c.id == character.id);
    final updated = isAlready
        ? state.where((c) => c.id != character.id).toList()
        : [...state, character];

    emit(updated);
    _storage.saveFavorites(updated);
  }

  bool isFavorite(CharacterModel character) {
    return state.any((c) => c.id == character.id);
  }
}
