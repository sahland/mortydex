part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object?> get props => [];
}

final class CharactersInitialState extends CharactersState {}

final class CharactersLoadingState extends CharactersState {}

final class CharactersResponseLoadedState extends CharactersState {
  final List<CharacterModel> characters;

  const CharactersResponseLoadedState({required this.characters});

  @override
  List<Object?> get props => [characters];
}

final class CharactersErrorState extends CharactersState {
  final String message;

  const CharactersErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
