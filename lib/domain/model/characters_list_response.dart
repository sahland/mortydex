import 'package:json_annotation/json_annotation.dart';

import 'character_model.dart';

part 'characters_list_response.g.dart';

@JsonSerializable()
class CharactersListResponse {
  const CharactersListResponse({
    required this.results,
  });

  final List<CharacterModel> results;

  factory CharactersListResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListResponseToJson(this);

  @override
  List<Object?> get props => [
        results,
      ];
}
