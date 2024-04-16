import 'package:editor/foundation/env/app_env_fields.dart';
import 'package:editor/foundation/env/main_env.dart';

abstract interface class Env implements AppEnvFields {
  factory Env() => _instance;

  static final Env _instance = MainEnv();
}
