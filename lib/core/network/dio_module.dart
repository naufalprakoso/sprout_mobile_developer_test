import 'package:dio/dio.dart';

class DioModule with DioMixin implements Dio {
  DioModule._({BaseOptions? options, String baseUrl = ''}) {
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
