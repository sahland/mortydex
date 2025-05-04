// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersListResponse _$CharactersListResponseFromJson(
        Map<String, dynamic> json) =>
    CharactersListResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersListResponseToJson(
        CharactersListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
