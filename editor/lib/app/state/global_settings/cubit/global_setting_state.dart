part of 'global_setting_cubit.dart';

@freezed
class GlobalSettingState with _$GlobalSettingState {
  const factory GlobalSettingState.base({
    required ThemeMode themeMode,
  }) = _Loaded;
}
