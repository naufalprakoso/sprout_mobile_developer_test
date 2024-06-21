import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:sprout_mobile_developer_test/core/errors/api_exception.dart';
import 'package:sprout_mobile_developer_test/core/errors/failures.dart';

mixin RepositoryMixin<D> {
  D get dataSource;

  Future<Either<Failure, T>> callDataSource<T>(
    Future<T> Function() call,
  ) async {
    try {
      return Right(await call());
    } on ApiException catch (e) {
      if (e is ServerFailure) {
        return const Left(ServerFailure());
      } else if (e is UnAuthorizedExceptions) {
        var message = e.errorBody['e'];
        return Left(
            UnAuthorizedFailure(message: message ?? e.errorBody.toString()));
      } else if (e is ErrorRequestException) {
        if (e.errorCode == 404) {
          return Left(NotFoundedFailure(message: _handleError(e)));
        } else if (e.errorCode == 429) {
          return Left(
            TooManyRequestFailure(
              errorStatus: e.errorCode,
              data: e.errorBody,
            ),
          );
        } else {
          return Left(ServerFailure(
              message: _handleError(e), errorCode: e.errorMessage));
        }
      }
    } on Exception catch (e) {
      if (e is PlatformException) {
        return Left(PlatformFailure(message: "${e.message} ${e.details}"));
      } else if (e is MissingPluginException) {
        return Left(MissingPluginFailure(message: e.message));
      } else {
        return Left(ServerFailure(
          message: _handleError(e),
          errorCode: _handleErrorCode(
            eitherM(),
          ),
        ));
      }
    }
    return const Left(PlatformFailure(message: 'Something is wrong...'));
  }

  String _handleError(Object error) {
    if (error.runtimeType == ErrorRequestException) {
      final err = error as ErrorRequestException;
      return err.errorMessage;
    } else {
      return (error.toString());
    }
  }

  String _handleErrorCode(Object error) {
    if (error.runtimeType == ErrorRequestException) {
      final err = error as ErrorRequestException;
      if (err.errorBody['error_code'] != null) {
        return err.errorBody['error_code'];
      }
      return err.errorMessage;
    } else {
      return (error.toString());
    }
  }
}
