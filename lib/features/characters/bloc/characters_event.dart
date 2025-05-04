part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

final class CharactersRequestedEvent extends CharactersEvent {
  const CharactersRequestedEvent({this.completer});

  final Completer<void>? completer;

  @override
  List<Object?> get props => [completer];
}
