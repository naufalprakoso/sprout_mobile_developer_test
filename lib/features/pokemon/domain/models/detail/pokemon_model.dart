import 'package:equatable/equatable.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/moves_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/species_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/types_model.dart';

import 'abilities_model.dart';
import 'sprites_model.dart';
import 'stats_model.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final int weight;
  final int height;
  final SpritesModel sprites;
  final List<StatsModel> stats;
  final List<AbilitiesModel> abilities;
  final List<TypesModel> types;
  final SpeciesModel species;
  final List<SmallPokemonModel> evolutions;
  final List<MovesModel> moves;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.sprites,
    required this.stats,
    required this.abilities,
    required this.types,
    required this.species,
    required this.evolutions,
    required this.moves,
  });

  factory PokemonModel.fromJson(
      Map<String, dynamic> json,
      SpeciesModel species,
      List<SmallPokemonModel> evolutions,
  ) {
    return PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((statJson) => StatsModel.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((abilityJson) => AbilitiesModel.fromJson(abilityJson as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((typeJson) => TypesModel.fromJson(typeJson as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((movesJson) => MovesModel.fromJson(movesJson as Map<String, dynamic>))
          .toList(),
      species: species,
      evolutions: evolutions,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    weight,
    height,
    sprites,
    stats,
    abilities,
    types,
    species,
    evolutions,
    moves,
  ];
}

class SmallPokemonModel extends Equatable {
  final int id;
  final String name;
  final int weight;
  final int height;
  final SpritesModel sprites;
  final List<StatsModel> stats;
  final List<AbilitiesModel> abilities;
  final List<TypesModel> types;

  const SmallPokemonModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.sprites,
    required this.stats,
    required this.abilities,
    required this.types,
  });

  factory SmallPokemonModel.fromJson(Map<String, dynamic> json) {
    return SmallPokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((statJson) => StatsModel.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((abilityJson) => AbilitiesModel.fromJson(abilityJson as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((typeJson) => TypesModel.fromJson(typeJson as Map<String, dynamic>))
          .toList()
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    weight,
    height,
    sprites,
    stats,
    abilities,
    types,
  ];
}
