import 'dart:async';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('HTTP REQUEST');
    print('==============================');

    print(
      '${options.method.toUpperCase()} ${options.path}',
    );

    print('Headers:');
    options.headers.forEach(
      (k, v) => print('$k: $v'),
    );

    print('Query Parameters:');
    options.queryParameters.forEach(
      (k, v) => print('$k: $v'),
    );

    if (options.data != null) {
      print('Body: ${options.data}');
    }

    print('==============================');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print('HTTP RESPONSE');
    print('==============================');

    print(
      '${response.statusCode} (${response.statusMessage})'
      '${response.requestOptions.path}',
    );

    print('Headers:');
    response.headers.forEach(
      (k, v) => print('$k: $v'),
    );

    print('Body: ${response.data}');
    print('==============================');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    var request = err.requestOptions;

    if (err.response != null) {
      var response = err.response!;
      print(
        '${err.response!.statusCode} (${err.response!.statusMessage})'
        '${request.path}',
      );

      print('Body: ${response.data}');
    } else {
      print(
        '${err.error} (${err.type})'
        '${request.path}',
      );
    }

    return super.onError(err, handler);
  }
}
