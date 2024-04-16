part of 'code_cubit.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.initial({
    @Default(false) bool isLoading,
    File? file,
  }) = _Initial;
}
