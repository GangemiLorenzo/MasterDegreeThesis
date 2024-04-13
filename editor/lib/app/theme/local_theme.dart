import 'package:editor/app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

/// Local theme, define here custom widget themes
class LocalTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      cardTheme: ThemeData.light().cardTheme.copyWith(
            surfaceTintColor: lightColorScheme.surface,
          ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      cardTheme: ThemeData.dark().cardTheme.copyWith(
            surfaceTintColor: darkColorScheme.surface,
          ),
    );
  }
}
