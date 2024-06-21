import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/theme/colors.dart';

class ItemPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const ItemPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      color: ColorsPalette.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
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
              pokemon.name.capitalizeFirstChar(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              spacing: 6.0,  // Horizontal space between the chips
              runSpacing: 6.0,  // Vertical space between the lines of chips
              children: pokemon.abilities.map((abilityModel) => Chip(
                label: Text(abilityModel.ability.name),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelStyle: const TextStyle(fontSize: 12),
                backgroundColor: ColorsPalette.lightGrey,
                shape: const StadiumBorder(side: BorderSide.none),
                visualDensity: VisualDensity.compact,
              )).toList(),
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}