import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sprout_mobile_developer_test/core/utils/base_state_v2.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/usecases/do_fetch_pokemon.dart';

class PokemonController extends GetxController {
  Rx<BaseStateV2<List<PokemonModel>>> pokemonModel = BaseStateV2<List<PokemonModel>>().obs;

  Future fetchPokemon(BuildContext context) async {
    pokemonModel.value = pokemonModel.value.copyWith(
      status: StatusState.loading,
    );

    List<PokemonModel> allPokemon = [];
    int dataSize = 50;

    for (int i = 1; i <= dataSize; i++) {
      final api = await DoFetchPokemon().call(i);

      api.fold(
            (l) {
          pokemonModel.value = pokemonModel.value
              .copyWith(status: StatusState.error, message: l.message);
          return;
        },
            (r) {
          allPokemon.add(r);
        },
      );
    }
    print("Check Success");
    pokemonModel.value = pokemonModel.value.copyWith(
      status: StatusState.success,
      data: allPokemon,
    );
  }
}
