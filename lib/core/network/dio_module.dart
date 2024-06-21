import 'package:dio/dio.dart';
import 'package:sprout_mobile_developer_test/core/constants/env.dart';

import 'logging_interceptor.dart';

class DioModule with DioMixin implements Dio {
  DioModule._({BaseOptions? options}) {
    options ??= BaseOptions(
      baseUrl: Env.BASE_URL,
      contentType: 'application/json',
    );

    this.options = options;
    interceptors.add(LoggingInterceptor());
    httpClientAdapter = HttpClientAdapter();
  }

  static Dio getInstance({BaseOptions? options, bool useHttp2 = true}) =>
      DioModule._(
        options: options,
      );
}
