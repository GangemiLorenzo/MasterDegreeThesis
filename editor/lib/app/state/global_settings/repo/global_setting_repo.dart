import 'package:editor/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const THEME_MODE_KEY = 'theme_mode_key';

@injectable
class GlobalSettingRepo {
  GlobalSettingRepo({
    required this.storageService,
  });

  final StorageService storageService;

  /// Returns the next theme mode
  ThemeMode nextThemeMode({required ThemeMode currentThemeMode}) =>
      switch (currentThemeMode) {
        ThemeMode.system => ThemeMode.light,
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
      };

  /// Stores the theme mode in the shared preferences
  Future<bool> storeThemeMode({required ThemeMode themeMode}) =>
      storageService.setString(key: THEME_MODE_KEY, value: themeMode.name);

  /// Returns the theme mode from the shared preferences
  ThemeMode getThemeMode() => ThemeMode.values.firstWhere(
        (e) => e.name == storageService.getString(THEME_MODE_KEY),
        orElse: () => ThemeMode.system,
      );
}
