part of 'global_setting_cubit.dart';

@freezed
class GlobalSettingState with _$GlobalSettingState {
  const factory GlobalSettingState({
    required ThemeMode themeMode,
  }) = _GlobalSettingState;
}
