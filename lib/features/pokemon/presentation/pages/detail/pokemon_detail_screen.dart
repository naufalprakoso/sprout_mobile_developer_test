import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/routes/args/pokemon_detail_args.dart';
import 'package:sprout_mobile_developer_test/theme/colors.dart';
import 'package:sprout_mobile_developer_test/theme/pokemon_colors.dart';

import 'about/pokemon_detail_about_screen.dart';
import 'pokemon_detail_bottom_bar.dart';

class PokemonDetailScreen extends StatefulWidget {

  const PokemonDetailScreen({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {

  PokemonDetailArgs getArguments(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments as PokemonDetailArgs;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = getArguments(context).pokemon;
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon Detail")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: PokemonColors.getPokemonTypeColor(pokemon.types.firstOrNull?.type.name ?? "unknown"),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      pokemon.name.capitalizeFirstChar(),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                  Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6))
                  ),
                  const SizedBox(height: 10),
                  Image.network(pokemon.sprites.other.officialArtwork.frontDefault, height: 150),
                  const SizedBox(height: 10),
                  Wrap(
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
                  )
                ],
              ),
            ),
            PokemonDetailBottomBar(pokemon: pokemon)
          ],
        ),
      ),
    );
  }
}
