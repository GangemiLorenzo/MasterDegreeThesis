import 'package:flutter/services.dart';

enum Flavor {
  DEV,
  // STG,
  // PROD,
}

/// Return the current flavor
Flavor get flavor => switch (appFlavor) {
      'dev' => Flavor.DEV,
      // 'stg' => Flavor.STG,
      // 'prod' => Flavor.PROD,
      _ => throw UnsupportedError('Flavor $appFlavor is not supported'),
    };
