import 'package:equatable/equatable.dart';

class DetailEvolutionChainModel extends Equatable {

  final Chain chain;
  final int id;

  const DetailEvolutionChainModel({
    required this.chain,
    required this.id,
  });

  factory DetailEvolutionChainModel.fromJson(Map<String, dynamic> json) {
    return DetailEvolutionChainModel(
      chain: Chain.fromJson(json['chain'] as Map<String, dynamic>),
      id: json['id'] as int,
    );
  }

  @override
  List<Object?> get props => [
    chain,
    id,
  ];

  List<SpeciesEvolution> getAllSpecies() {
    return _extractSpeciesFromChain(chain);
  }

  List<SpeciesEvolution> _extractSpeciesFromChain(Chain chain) {
    List<SpeciesEvolution> speciesList = [];
    speciesList.add(chain.species);

    for (EvolvesTo evolvesTo in chain.evolvesTo) {
      speciesList.addAll(_extractSpeciesFromEvolvesTo(evolvesTo));
    }

    return speciesList;
  }

  List<SpeciesEvolution> _extractSpeciesFromEvolvesTo(EvolvesTo evolvesTo) {
    List<SpeciesEvolution> speciesList = [];
    speciesList.add(evolvesTo.species);

    for (EvolvesTo subEvolvesTo in evolvesTo.evolvesTo) {
      speciesList.addAll(_extractSpeciesFromEvolvesTo(subEvolvesTo));
    }

    return speciesList;
  }
}

class Chain extends Equatable {

  final List<EvolvesTo> evolvesTo;
  final SpeciesEvolution species;

  const Chain({
    required this.evolvesTo,
    required this.species,
  });

  factory Chain.fromJson(Map<String, dynamic> json) {
    return Chain(
      evolvesTo: (json['evolves_to'] as List<dynamic>)
          .map((statJson) => EvolvesTo.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      species: SpeciesEvolution.fromJson(json['species'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    evolvesTo,
    species,
  ];
}

class EvolvesTo extends Equatable {

  final List<EvolvesTo> evolvesTo;
  final SpeciesEvolution species;

  const EvolvesTo({
    required this.evolvesTo,
    required this.species,
  });

  factory EvolvesTo.fromJson(Map<String, dynamic> json) {
    return EvolvesTo(
      evolvesTo: (json['evolves_to'] as List<dynamic>)
          .map((statJson) => EvolvesTo.fromJson(statJson as Map<String, dynamic>))
          .toList(),
      species: SpeciesEvolution.fromJson(json['species'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    evolvesTo,
    species,
  ];
}

class SpeciesEvolution extends Equatable {

  final String name;
  final String url;

  const SpeciesEvolution({
    required this.name,
    required this.url,
  });

  factory SpeciesEvolution.fromJson(Map<String, dynamic> json) {
    return SpeciesEvolution(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
    url,
  ];
}
