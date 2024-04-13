import 'package:editor/foundation/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Global instance for service locator.
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
  throwOnMissingDependencies: true,
)
Future<void> configureDependencies() async => getIt.init();
