import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

class ItemPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const ItemPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              pokemon.sprites.other.officialArtwork.frontDefault,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              label: Text(pokemon.abilities.join(", ")),
            ),
          ),
        ],
      ),
    );
  }
}