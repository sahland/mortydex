import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mortydex/data/data.dart';
import 'package:mortydex/domain/domain.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({
    required CharactersListApiClient charactersApiClient,
    required CharactersCache charactersCache,
  })  : _charactersApiClient = charactersApiClient,
        _charactersCache = charactersCache,
        super(CharactersInitialState()) {
    on<CharactersRequestedEvent>(_onCharactersRequested);
  }

  final CharactersListApiClient _charactersApiClient;
  final CharactersCache _charactersCache;

  Future<void> _onCharactersRequested(
    CharactersRequestedEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoadingState());

    try {
      final response = await _charactersApiClient.getCharactersList();
      final characters = response.results;

      if (characters.isEmpty) {
        emit(const CharactersErrorState(message: 'No characters found.'));
      } else {
        await _charactersCache.save(characters);
        emit(CharactersResponseLoadedState(characters: characters));
      }
    } catch (e) {
      final cached = _charactersCache.load();
      if (cached.isNotEmpty) {
        emit(CharactersResponseLoadedState(characters: cached));
      } else {
        emit(CharactersErrorState(message: e.toString()));
      }
    } finally {
      event.completer?.complete();
    }
  }
}
