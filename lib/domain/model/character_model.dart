import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'location_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Equatable {
  const CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.location,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  final LocationModel location;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        image,
        location,
      ];
}
