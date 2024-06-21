import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField()
  static final String BASE_URL = _Env.BASE_URL;
}