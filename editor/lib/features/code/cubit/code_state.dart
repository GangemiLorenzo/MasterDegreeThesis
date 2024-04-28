part of 'code_cubit.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.initial({
    @Default(false) bool isLoading,
    File? file,
  }) = _Initial;

  const factory CodeState.processing({
    required File file,
    required String taskId,
  }) = _Processing;

  const factory CodeState.loaded({
    required File file,
    @Default(false) bool isLoading,
    // Here goes the request result
  }) = _Loaded;
}
