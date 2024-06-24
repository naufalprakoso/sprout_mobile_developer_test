
import 'package:sprout_mobile_developer_test/core/constants/api_url.dart';
import 'package:sprout_mobile_developer_test/core/network/network_module.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/evolution_chain_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/species_model.dart';

abstract class PokemonDataSource {
  Future<PokemonModel> fetchPokemon(int id);
}

class PokemonDataSourceImpl extends NetworkModule implements PokemonDataSource {

  @override
  Future<PokemonModel> fetchPokemon(int id) async {
    final pokemonResponse = await getMethod(
      "${ApiUrl.pokemon}/$id",
    );
    final speciesResponse = await getMethod(
      "${ApiUrl.pokemonSpecies}/$id",
    );
    final pokemonSpecies = SpeciesModel.fromJson(speciesResponse);
    final detailEvolutionResponse = await getMethod(
      pokemonSpecies.evolutionChain.url,
    );

    final evolutions = DetailEvolutionChainModel.fromJson(detailEvolutionResponse).getAllSpecies();
    List<Future<dynamic>> pokemonFutures = evolutions.map((species) {
      final pokemonId = extractIdFromSpeciesUrl(species.url);
      return getMethod("${ApiUrl.pokemon}/$pokemonId")!;
    }).toList();
    List<dynamic> pokemonResponses = await Future.wait(pokemonFutures);
    List<SmallPokemonModel> speciesEvolutions = pokemonResponses.map((response) {
      return SmallPokemonModel.fromJson(response as Map<String, dynamic>);
    }).toList();

    return PokemonModel.fromJson(
        pokemonResponse,
        pokemonSpecies,
        speciesEvolutions
    );
  }

  String extractIdFromSpeciesUrl(String url) {
    List<String> parts = url.split('/');
    String id = parts[parts.length - 2];
    return id;
  }
}
