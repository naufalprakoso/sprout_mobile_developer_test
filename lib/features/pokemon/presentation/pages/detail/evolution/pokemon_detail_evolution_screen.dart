import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/pages/detail/evolution/item_evolution_pokemon.dart';

class PokemonDetailEvolutionScreen extends StatelessWidget {

  final List<SmallPokemonModel> species;

  const PokemonDetailEvolutionScreen({
    super.key,
    required this.species
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemCount: species.length,
        itemBuilder: (context, index) {
          final pokemon = species[index];
          return ItemEvolutionPokemon(pokemon: pokemon);
        },
      ),
    );
  }
}