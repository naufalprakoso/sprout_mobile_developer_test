import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sprout_mobile_developer_test/core/utils/base_state_v2.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/usecases/do_fetch_pokemon.dart';

class PokemonController extends GetxController {
  Rx<BaseStateV2<List<PokemonModel>>> pokemonModel = BaseStateV2<List<PokemonModel>>().obs;
  int dataSize = 15;

  Future fetchPokemon(BuildContext context) async {
    pokemonModel.value = pokemonModel.value.copyWith(
      status: StatusState.loading,
    );

    List<PokemonModel> allPokemon = [];
    bool isAnyFetchFailed = false;

    for (int i = 1; i <= dataSize; i++) {
      final api = await DoFetchPokemon().call(i);
      api.fold(
            (l) {
          isAnyFetchFailed = true;
          pokemonModel.value = pokemonModel.value.copyWith(
              status: StatusState.error,
              message: l.message
          );
        },
            (r) => allPokemon.add(r),
      );
    }

    if (!isAnyFetchFailed) {
      pokemonModel.value = pokemonModel.value.copyWith(
        status: StatusState.success,
        data: allPokemon,
      );
    }
  }
}
