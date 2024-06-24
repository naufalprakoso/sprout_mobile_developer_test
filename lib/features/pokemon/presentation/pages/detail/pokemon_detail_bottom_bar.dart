import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/pages/detail/moves/pokemon_detail_moves_screen.dart';
import 'package:sprout_mobile_developer_test/theme/colors.dart';
import 'package:sprout_mobile_developer_test/theme/pokemon_colors.dart';

import 'about/pokemon_detail_about_screen.dart';
import 'evolution/pokemon_detail_evolution_screen.dart';
import 'stats/pokemon_detail_stats_screen.dart';

class PokemonDetailBottomBar extends StatefulWidget {
  final PokemonModel pokemon;

  const PokemonDetailBottomBar({
    super.key,
    required this.pokemon
  });


  @override
  State<StatefulWidget> createState() => _PokemonDetailBottomBarState();
}

class _PokemonDetailBottomBarState extends State<PokemonDetailBottomBar> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14
          ),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14
          ),
          labelColor: ColorsPalette.darkGrey,
          overlayColor: MaterialStateProperty.all(null),
          indicatorColor: PokemonColors.getPokemonTypeColor(widget.pokemon.types.firstOrNull?.type.name ?? "unknown"),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 12),
          dividerHeight: 0,
          tabs: const [
            Tab(text: "About"),
            Tab(text: "Base Stats"),
            Tab(text: "Evolution"),
            Tab(text: "Moves"),
          ],
          indicatorWeight: 3,
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: [
              PokemonDetailAboutScreen(pokemon: widget.pokemon),
              PokemonDetailStatsScreen(pokemon: widget.pokemon),
              PokemonDetailEvolutionScreen(species: widget.pokemon.evolutions),
              PokemonDetailMovesScreen(moves: widget.pokemon.moves),
            ],
          ),
        )
      ],
    );
  }
}
