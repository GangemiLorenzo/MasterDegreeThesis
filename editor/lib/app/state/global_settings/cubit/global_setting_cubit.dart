import 'package:editor/app/state/global_settings/repo/global_setting_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'global_setting_cubit.freezed.dart';
part 'global_setting_state.dart';

/// Global setting cubit for global setting purposes
@singleton
class GlobalSettingCubit extends Cubit<GlobalSettingState> {
  GlobalSettingCubit({
    required this.repo,
  }) : super(
          GlobalSettingState(
            themeMode: repo.getThemeMode(),
          ),
        );

  final GlobalSettingRepo repo;

  /// Switches the theme from light to dark to system
  void switchTheme() {
    final themeMode = repo.nextThemeMode(currentThemeMode: state.themeMode);
    emit(state.copyWith(themeMode: themeMode));
    repo.storeThemeMode(themeMode: themeMode);
  }

  /// Sets the theme to the given mode
  void setTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
    repo.storeThemeMode(themeMode: mode);
  }
}
