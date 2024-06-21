import 'package:flutter/material.dart';

class PokemonDetailAboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Details about Bulbasaur"),
    );
  }
}

class BaseStatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Base stats here"),
    );
  }
}

class EvolutionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Evolution details here"),
    );
  }
}

class MovesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("List of moves here"),
    );
  }
}
