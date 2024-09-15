part of 'code_cubit.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.initial({
    @Default(false) bool isLoading,
    String? fileName,
    Uint8List? fileBytes,
  }) = _Initial;

  const factory CodeState.processing({
    required String fileName,
    required Uint8List fileBytes,
    required String taskId,
    required int progress,
    required String message,
  }) = _Processing;

  const factory CodeState.loaded({
    required String fileName,
    required Uint8List fileBytes,
    required Task task,
    @Default(false) bool isLoading,
    String? selectedItem,
    @Default(false) bool justSavedFile,
    @Default(false) bool showSettings,
  }) = _Loaded;
}
