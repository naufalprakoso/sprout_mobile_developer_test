import 'package:dio/dio.dart';
import 'package:sprout_mobile_developer_test/core/errors/api_exception.dart';

import 'dio_module.dart';
import 'result.dart';

abstract class NetworkModule {
  BaseOptions? options;
  Dio get _dio => DioModule.getInstance(options: options);

  Future<Result<T>> _safeCallApi<T>(Future<Response<T>> call) async {
    try {
      var response = await call;
      return Result.success(
        response.data,
        response.statusMessage,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return Result.error(
          e.response!.statusCode ?? 400,
          e.response!.data,
        );
      } else {
        return Result.timeout(
          '' as dynamic,
          'Network Failure',
        );
      }
    } catch (ex) {
      return Result.timeout(
        '' as dynamic,
        'Network Failure',
      );
    }
  }

  Future<dynamic>? getMethod(
    String endpoint, {
    Map<String, dynamic>? param,
  }) async {
    var response = await _safeCallApi(
      _dio.get(
        endpoint,
        queryParameters: param,
      ),
    );

    return responseHandler(response);
  }

  dynamic responseHandler(Result<dynamic> result) {
    switch (result.status) {
      case Status.success:
        return result.body;
      case Status.error:
        if (result.code == 401) {
          throw UnAuthorizedExceptions(result.body);
        } else {
          throw ErrorRequestException(result.code, result.body);
        }
      case Status.unreachable:
        throw NetworkException(result.message);
      default:
        throw ArgumentError();
    }
  }
}
