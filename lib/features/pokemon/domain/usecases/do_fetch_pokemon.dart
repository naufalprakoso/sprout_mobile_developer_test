import 'package:dartz/dartz.dart';
import 'package:sprout_mobile_developer_test/core/errors/failures.dart';
import 'package:sprout_mobile_developer_test/core/mixins/usecase_mixin.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/data/repositories/pokemon_repository.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

class DoFetchPokemon with UsecaseMixin<PokemonModel, int, PokemonRepository> {
  @override
  Future<Either<Failure, PokemonModel>> call(int params) async {
    return repo.fetchPokemon(params);
  }

  @override
  PokemonRepository get repo => PokemonRepositoryImpl();
}
