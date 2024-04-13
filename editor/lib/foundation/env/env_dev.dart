import 'package:editor/foundation/env/app_env_fields.dart';
import 'package:editor/foundation/env/env.dart';
import 'package:envied/envied.dart';

part 'env_dev.g.dart';

/// Development environment
@Envied(name: 'Dev', path: '.env.dev')
final class EnvDev implements Env, AppEnvFields {
  EnvDev();

  @override
  @EnviedField(varName: 'BE_URL')
  final String beUrl = _Dev.beUrl;
}
