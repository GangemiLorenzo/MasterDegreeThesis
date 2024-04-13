import 'dart:async';
import 'dart:developer';

import 'package:editor/app/app.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  bootstrap(() => const App());
}

/// Bootstraps the application:
/// - Ensures the Flutter binding is initialized.
/// - Initializes DI.
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  BindingBase.debugZoneErrorsAreFatal = true;

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      Bloc.observer = const AppBlocObserver();

      final futures = [
        configureDependencies(),
        // Add here any other initialization futures
      ];

      await Future.wait(futures);
      return runApp(
        await builder(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

/// Logs all bloc events and errors
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
