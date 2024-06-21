import 'api_error_type.dart';

abstract class ApiException implements Exception {
  final String? _prefix;
  final String? _message;

  ApiException(this._prefix, this._message);

  @override
  String toString() => '$_prefix :$_message';
}

class UnAuthorizedExceptions extends ApiException {
  final dynamic errorBody;

  UnAuthorizedExceptions(this.errorBody) : super('UnAuthorized', '$errorBody');
}

class NetworkException extends ApiException {
  final String? message;
  NetworkException(this.message) : super('Network Error', message);
}

class ErrorRequestException extends ApiException {
  ErrorRequestException(
    this.errorCode,
    this.errorBody,
  ) : super(
          'Error $errorCode',
          '$errorBody',
        );

  final int errorCode;
  final dynamic errorBody;

  String get errorMessage {
    if (errorBody is String) return errorBody;
    if (errorBody is Map<String, dynamic>) {
      var errorMap = errorBody as Map<String, dynamic>;
      if (errorMap.containsKey('message')) {
        return errorBody['message'];
      } else if (errorMap.containsKey('error')) {
        return errorBody['error'];
      } else if (errorMap.containsKey('data')) {
        if (errorBody['data'] is Map<String, dynamic>) {
          var dataMap = errorBody['data'] as Map<String, dynamic>;
          if (dataMap.containsKey("error_message")) {
            return dataMap["error_message"];
          }
        } else if (errorBody['data'] is String) {
          return errorBody['data'];
        }
      }
    }

    throw UnimplementedError('Unhandled Error: $errorBody');
  }

  String get errorType {
    if (errorBody is Map<String, dynamic>) {
      var errorMap = errorBody as Map<String, dynamic>;
      if (errorMap.containsKey('error_type')) {
        return errorBody['error_type'];
      }
    }

    return ApiErrorType.unknown;
  }
}
