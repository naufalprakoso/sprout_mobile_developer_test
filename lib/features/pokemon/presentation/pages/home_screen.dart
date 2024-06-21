import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprout_mobile_developer_test/core/utils/base_state_v2.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/controllers/pokemon_controller.dart';

import 'item_pokemon.dart';

class HomeScreen extends StatelessWidget {
  final PokemonController controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Obx(() {
        if (controller.pokemonModel.value.status == StatusState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.pokemonModel.value.status == StatusState.error) {
          return Center(child: Text('Error: ${controller.pokemonModel.value.message}'));
        } else if (controller.pokemonModel.value.status == StatusState.success) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            itemCount: controller.pokemonModel.value.data?.length ?? 0,
            itemBuilder: (context, index) {
              final pokemon = controller.pokemonModel.value.data![index];
              return ItemPokemon(pokemon: pokemon);
            },
          );
        } else {
          return const Center(child: Text('No data'));
        }
      }),
    );
  }
}