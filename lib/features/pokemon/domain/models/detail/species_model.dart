import 'package:equatable/equatable.dart';

import 'genera_model.dart';

class SpeciesModel extends Equatable {
  final int id;
  final String name;
  final int baseHappiness;
  final int captureRate;
  final List<EggGroupsModel> eggGroups;
  final GrowthRateModel growthRate;
  final HabitatModel habitat;
  final List<GeneraModel> genera;
  final EvolutionChainModel evolutionChain;

  const SpeciesModel({
    required this.id,
    required this.name,
    required this.baseHappiness,
    required this.captureRate,
    required this.eggGroups,
    required this.growthRate,
    required this.habitat,
    required this.genera,
    required this.evolutionChain,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      baseHappiness: json['base_happiness'] as int,
      captureRate: json['capture_rate'] as int,
      eggGroups: (json['egg_groups'] as List<dynamic>)
          .map((statJson) => EggGroupsModel.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      growthRate: GrowthRateModel.fromJson(json['growth_rate'] as Map<String, dynamic>),
      habitat: HabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      evolutionChain: EvolutionChainModel.fromJson(json['evolution_chain'] as Map<String, dynamic>),
      genera: (json['genera'] as List<dynamic>)
          .map((statJson) => GeneraModel.fromJson(statJson as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    baseHappiness,
    captureRate,
    eggGroups,
    growthRate,
    habitat,
    genera,
    evolutionChain,
  ];
}

class EggGroupsModel extends Equatable {
  final String name;

  const EggGroupsModel({
    required this.name,
  });

  factory EggGroupsModel.fromJson(Map<String, dynamic> json) {
    return EggGroupsModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}

class GrowthRateModel extends Equatable {
  final String name;

  const GrowthRateModel({
    required this.name,
  });

  factory GrowthRateModel.fromJson(Map<String, dynamic> json) {
    return GrowthRateModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}

class HabitatModel extends Equatable {
  final String name;

  const HabitatModel({
    required this.name,
  });

  factory HabitatModel.fromJson(Map<String, dynamic> json) {
    return HabitatModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}

class EvolutionChainModel extends Equatable {
  final String url;

  const EvolutionChainModel({
    required this.url,
  });

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    return EvolutionChainModel(
      url: json['url'] as String,
    );
  }

  @override
  List<Object?> get props => [
    url,
  ];
}
