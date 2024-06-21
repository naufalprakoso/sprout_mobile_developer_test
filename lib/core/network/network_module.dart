import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Map<String, dynamic>? headers,
    bool? withAccessToken,
  }) async {
    Map<String, dynamic>? mHeaders = headers;
    if (withAccessToken == true) {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(SharedPref.authToken) ?? '';
      if (mHeaders != null) {
        mHeaders["Authorization"] = "Bearer $accessToken";
      } else {
        mHeaders = {"Authorization": "Bearer $accessToken"};
      }
    }

    var options = Options(headers: mHeaders);
    var response = await _safeCallApi(
      _dio.get(
        endpoint,
        queryParameters: param,
        options: options,
      ),
    );

    return responseHandler(response);
  }

  Future<dynamic>? postMethod(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withAccessToken,
  }) async {
    Map<String, dynamic>? mHeaders = headers;
    if (withAccessToken == true) {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(SharedPref.authToken) ?? '';
      if (mHeaders != null) {
        mHeaders["Authorization"] = "Bearer $accessToken";
      } else {
        mHeaders = {"Authorization": "Bearer $accessToken"};
      }
    }

    var options = Options(headers: mHeaders);
    var response = await _safeCallApi(
      _dio.post(
        endpoint,
        data: body,
        options: options,
      ),
    );

    return responseHandler(response);
  }

  Future<dynamic>? patchMethod(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withAccessToken,
  }) async {
    Map<String, dynamic>? mHeaders = headers;
    if (withAccessToken == true) {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(SharedPref.authToken) ?? '';
      if (mHeaders != null) {
        mHeaders["Authorization"] = "Bearer $accessToken";
      } else {
        mHeaders = {"Authorization": "Bearer $accessToken"};
      }
    }

    var options = Options(headers: mHeaders);
    var response = await _safeCallApi(
        _dio.patch(
        endpoint,
        data: body,
        options: options,
        ),
    );

    return responseHandler(response);
  }

  Future<dynamic>? deleteMethod(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? headers,
        bool? withAccessToken,
      }) async {
    Map<String, dynamic>? mHeaders = headers;
    if (withAccessToken == true) {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(SharedPref.authToken) ?? '';
      if (mHeaders != null) {
        mHeaders["Authorization"] = "Bearer $accessToken";
      } else {
        mHeaders = {"Authorization": "Bearer $accessToken"};
      }
    }

    var options = Options(headers: mHeaders);
    var response = await _safeCallApi(
      _dio.delete(
        endpoint,
        data: body,
        options: options,
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
