import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final String? errorCode;

  const Failure({
    this.message,
    this.errorCode,
    List properties = const <dynamic>[],
  });
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message, errorCode];
}

class NotFoundedFailure extends Failure {
  const NotFoundedFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class PlatformFailure extends Failure {
  const PlatformFailure({super.message, super.errorCode});
  @override
  List<Object?> get props => [message];
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message];
}

class MissingPluginFailure extends Failure {
  const MissingPluginFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message];
}

class TooManyRequestFailure extends Failure {
  final int? errorStatus;
  final dynamic data;
  const TooManyRequestFailure({
    super.message,
    this.data,
    this.errorStatus,
  });

  @override
  List<Object?> get props => [
        message,
        errorStatus,
        data,
      ];
}

class IgnoredFailure extends Failure {
  const IgnoredFailure({super.message, super.errorCode});

  @override
  List<Object?> get props => [message];
}
