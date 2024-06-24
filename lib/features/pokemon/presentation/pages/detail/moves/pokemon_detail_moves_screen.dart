import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/core/utils/number_extension.dart';
import 'package:sprout_mobile_developer_test/core/utils/string_extension.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/moves_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

class PokemonDetailMovesScreen extends StatelessWidget {

  final List<MovesModel> moves;

  const PokemonDetailMovesScreen({
    super.key,
    required this.moves
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Moves", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 4),
            Text(
                moves.map((move) => move.move.name.capitalizeFirstChar()).toList().join("\n- ")
            ),
          ],
        ),
      ),
    );
  }
}
