import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/number_extension.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

class PokemonDetailAboutScreen extends StatelessWidget {

  final PokemonModel pokemon;

  const PokemonDetailAboutScreen({
    super.key,
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    final speciesName = pokemon.species.genera.firstWhere(
            (item) => item.language.name == 'en',
        orElse: () => pokemon.species.genera.first).genus;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoRow("Species", speciesName),
          infoRow("Habitat", pokemon.species.habitat.name.capitalizeFirstChar()),
          infoRow("Height", pokemon.height.convertToHeight()),
          infoRow("Weight", pokemon.weight.convertToWeight()),
          infoRow("Abilities", pokemon.abilities.map((ability) => ability.ability.name.capitalizeFirstChar()).toList().join(", ")),
          const SizedBox(height: 20),
          const Text("Breeding", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 4),
          infoRow("Egg Groups", pokemon.species.eggGroups.map((eggGroup) => eggGroup.name.word()).toList().join(", ")),
        ],
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}