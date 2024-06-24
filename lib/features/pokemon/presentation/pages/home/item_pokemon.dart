import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/routes/args/pokemon_detail_args.dart';
import 'package:sprout_mobile_developer_test/routes/main_route.dart';
import 'package:sprout_mobile_developer_test/theme/colors.dart';
import 'package:sprout_mobile_developer_test/theme/pokemon_colors.dart';

class ItemPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const ItemPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            MainRoute.detailRoute,
            arguments: PokemonDetailArgs(pokemon: pokemon)
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 4,
        color: PokemonColors.getPokemonTypeColor(pokemon.types.firstOrNull?.type.name ?? "unknown"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                pokemon.sprites.other.officialArtwork.frontDefault,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                pokemon.name.capitalizeFirstChar(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                children: pokemon.types.map((typesModel) => Chip(
                  label: Text(typesModel.type.name.capitalizeFirstChar()),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  labelStyle: TextStyle(fontSize: 11, color: ColorsPalette.darkGrey),
                  shape: const StadiumBorder(side: BorderSide(style: BorderStyle.none)),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                )).toList(),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
