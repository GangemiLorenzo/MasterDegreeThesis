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
    required int progress,
    required String message,
  }) = _Processing;

  const factory CodeState.loaded({
    required File file,
    required Task task,
    @Default(false) bool isLoading,
    String? selectedItem,
    @Default(false) bool justSavedFile,
  }) = _Loaded;
}
