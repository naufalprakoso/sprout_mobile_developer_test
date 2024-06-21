import 'package:flutter/material.dart';

import 'pokemon_detail_about_screen.dart';

class PokemonDetailBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          bottom: TabBar(
            tabs: [
              Tab(text: "About"),
              Tab(text: "Base Stats"),
              Tab(text: "Evolution"),
              Tab(text: "Moves"),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: PokemonDetailAboutScreen(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BaseStatsTab(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: EvolutionTab(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MovesTab(),
            ),
          ],
        ),
      ),
    );
  }
}
