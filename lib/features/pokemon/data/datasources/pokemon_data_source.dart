
import 'package:sprout_mobile_developer_test/core/constants/api_url.dart';
import 'package:sprout_mobile_developer_test/core/network/network_module.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

abstract class PokemonDataSource {
  Future<PokemonModel> fetchPokemon(int id);
}

class PokemonDataSourceImpl extends NetworkModule implements PokemonDataSource {

  @override
  Future<PokemonModel> fetchPokemon(int id) async {
    final result = await getMethod(
      "${ApiUrl.pokemon}/$id",
    );
    print("Check: Result = $result");
    return PokemonModel.fromJson(result);
  }
}
