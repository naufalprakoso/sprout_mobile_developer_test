import 'package:dartz/dartz.dart';
import 'package:sprout_mobile_developer_test/core/errors/failures.dart';

mixin UsecaseMixin<T, P, R> {
  R get repo;

  Future<Either<Failure, T>> call(P params);
}

class NoParams {}
