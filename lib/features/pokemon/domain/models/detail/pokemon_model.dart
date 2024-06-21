import 'package:equatable/equatable.dart';

import 'abilities_model.dart';
import 'sprites_model.dart';
import 'stats_model.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final SpritesModel sprites;
  final List<StatsModel> stats;
  final List<AbilitiesModel> abilities;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.abilities,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((statJson) => StatsModel.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((abilityJson) => AbilitiesModel.fromJson(abilityJson as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    sprites,
    stats,
    abilities,
  ];
}
