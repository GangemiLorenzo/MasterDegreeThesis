import 'package:editor/app/state/secure_settings/secure_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'secure_settings_cubit.freezed.dart';
part 'secure_settings_state.dart';

@singleton
class SecureSettingsCubit extends Cubit<SecureSettingsState> {
  SecureSettingsCubit({
    required this.repo,
  }) : super(
          SecureSettingsState(
            openAIKey: repo.getOpenAIKey(),
          ),
        );

  final SecureSettingsRepo repo;

  void setOpenAIKey(String openAIKey) {
    emit(state.copyWith(openAIKey: openAIKey));
    repo.storeOpenAIKey(openAIKey: openAIKey);
  }
}
