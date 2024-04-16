import 'package:editor/foundation/env/app_env_fields.dart';
import 'package:editor/foundation/env/env.dart';
import 'package:envied/envied.dart';

part 'main_env.g.dart';

/// Development environment
@Envied(name: 'MainEnv', path: '.env')
final class MainEnv implements Env, AppEnvFields {
  MainEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _MainEnv.baseUrl;
}
