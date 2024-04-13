import 'package:editor/foundation/env/app_env_fields.dart';
import 'package:editor/foundation/env/env_dev.dart';
import 'package:editor/foundation/flavor.dart';

abstract interface class Env implements AppEnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (flavor) {
    Flavor.DEV => EnvDev(),
    // Flavor.STG => EnvStg(),
    // Flavor.PROD => EnvProd(),
  };
}
