import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/number_extension.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/theme/pokemon_colors.dart';

class PokemonDetailStatsScreen extends StatelessWidget {

  final PokemonModel pokemon;

  const PokemonDetailStatsScreen({
    super.key,
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: pokemon.stats.map((stat) {
          return buildStatRow(stat.stat.name.word(), stat.baseStat, 100);
        }).toList(),
      ),
    );
  }

  Widget buildStatRow(String statName, int value, int maxValue) {
    Color barColor = value < 50 ? PokemonColors.fireColor : PokemonColors.grassColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(statName),
          ),
          Expanded(
            flex: 1,
            child: Text(
                value.toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: value / maxValue,
                valueColor: AlwaysStoppedAnimation<Color>(barColor),
                backgroundColor: barColor.withOpacity(0.3),
                minHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}