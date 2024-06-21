import 'package:dartz/dartz.dart';
import 'package:sprout_mobile_developer_test/core/errors/failures.dart';
import 'package:sprout_mobile_developer_test/core/mixins/repository_mixin.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/data/datasources/pokemon_data_source.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/domain/models/detail/pokemon_model.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonModel>> fetchPokemon(int id);
}

class PokemonRepositoryImpl
    with RepositoryMixin<PokemonDataSource>
    implements PokemonRepository {
  @override
  get dataSource => PokemonDataSourceImpl();

  @override
  Future<Either<Failure, PokemonModel>> fetchPokemon(int id) {
    return callDataSource(() => dataSource.fetchPokemon(id));
  }
}
