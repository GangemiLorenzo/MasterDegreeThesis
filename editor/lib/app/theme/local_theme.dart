import 'package:editor/app/theme/theme.dart';
import 'package:flutter/material.dart';

/// Local theme, define here custom widget themes
class LocalTheme {
  static ThemeData get _lightThemeData => ThemeData.light();
  static ThemeData get _darkThemeData => ThemeData.dark();

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      cardTheme: _lightThemeData.cardTheme.copyWith(
        surfaceTintColor: lightColorScheme.surfaceTint,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius8,
            ),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      cardTheme: _darkThemeData.cardTheme.copyWith(
        surfaceTintColor: darkColorScheme.surfaceTint,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius8,
            ),
          ),
        ),
      ),
    );
  }
}
