part of 'secure_settings_cubit.dart';

@freezed
class SecureSettingsState with _$SecureSettingsState {
  const factory SecureSettingsState({
    required String openAIKey,
  }) = _SecureSettingsState;
}
