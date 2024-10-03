import 'package:editor/api/gen/api_client.enums.swagger.dart';
import 'package:editor/features/code/model/link.dart';
import 'package:editor/features/code/model/source_unit.dart';
import 'package:editor/features/code/model/task.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor/features/code/model/vulnerability.dart';
import 'package:editor/features/code/repo/code_repo.dart';
import 'package:editor/utils/polling_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'code_cubit.freezed.dart';
part 'code_state.dart';

@injectable
class CodeCubit extends Cubit<CodeState> {
  CodeCubit({
    required this.repo,
  }) : super(
          const CodeState.initial(),
        );

  final CodeRepo repo;
  PollingManager? _taskPollingManager;

  void openSmartContract() async {
    if (state is! _Initial) {
      return;
    }
    final currentState = state as _Initial;

    emit(
      currentState.copyWith(
        isLoading: true,
      ),
    );

    final platformFile = await repo.openSmartContract();
    final fileBytes =
        platformFile != null ? await repo.getBytes(platformFile) : null;

    if (platformFile == null || fileBytes == null) {
      emit(
        currentState.copyWith(
          isLoading: false,
        ),
      );
      return;
    }

    emit(
      currentState.copyWith(
        isLoading: false,
        fileName: platformFile.name,
        fileBytes: fileBytes,
      ),
    );
  }

  /// Submits the file to the server.
  void submitFile(String openAiKey) async {
    if (state is! _Initial) {
      return;
    }

    final currentState = state as _Initial;

    if (currentState.fileBytes == null) {
      return;
    }

    try {
      emit(
        currentState.copyWith(
          isLoading: true,
        ),
      );

      final taskId = await repo.uploadFile(
        fileBytes: currentState.fileBytes!,
        openAIKey: openAiKey,
      );

      emit(
        CodeState.processing(
          fileBytes: currentState.fileBytes!,
          fileName: currentState.fileName ?? '',
          taskId: taskId,
          progress: 0,
          message: 'Uploading the smart contract',
        ),
      );
    } catch (e) {
      debugPrint(' Failed to upload file: $e');
      emit(
        currentState.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  /// Starts polling for the task status.
  void startPollingTask() {
    if (state is! _Processing) {
      return;
    }

    if (_taskPollingManager?.isActive ?? false) {
      return;
    }

    debugPrint('Start polling');

    _taskPollingManager = PollingManager(
      interval: const Duration(milliseconds: 500),
      action: (_) => _fetchTask(),
    )..start();
  }

  /// Fetches the task status.
  void _fetchTask() async {
    if (state is! _Processing) {
      return;
    }

    final currentState = state as _Processing;

    final taskDto = await repo.getTask(currentState.taskId);

    if (taskDto.status ==
        TasksTaskIdGet$ResponseStatus.swaggerGeneratedUnknown) {
      throw Exception('Unknown task status');
    }

    if (taskDto.status != TasksTaskIdGet$ResponseStatus.processing) {
      _taskPollingManager?.stop();
    }

    if (taskDto.status == TasksTaskIdGet$ResponseStatus.failed) {
      emit(
        const CodeState.initial(),
      );
      return;
    }

    if (taskDto.status == TasksTaskIdGet$ResponseStatus.completed) {
      final sourceUnit =
          SourceUnit.fromJson(taskDto.result! as Map<String, dynamic>);

      final links = List<Map<String, dynamic>>.from(taskDto.links as List)
          .map((e) => Link.fromJson(e))
          .toList();

      final x =
          (taskDto.vulnerabilities! as Map<String, dynamic>)['vulnerabilities'];
      final vulnerabilities = List<Map<String, dynamic>>.from(x as List)
          .map((e) => Vulnerability.fromJson(e))
          .toList();

      final warnings = List<Map<String, dynamic>>.from(taskDto.warnings as List)
          .map((e) => e['id'] as String)
          .toList();

      final task = Task(
        id: taskDto.id,
        sourceUnit: sourceUnit,
        links: links,
        warnings: warnings,
        vulnerabilities: vulnerabilities,
      );
      emit(
        CodeState.loaded(
          fileBytes: currentState.fileBytes,
          fileName: currentState.fileName,
          task: task,
        ),
      );
      return;
    }

    emit(
      currentState.copyWith(
        progress: taskDto.progress,
        message: taskDto.statusMessage,
      ),
    );
  }

  void selectItem(String id) {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;

    if (currentState.selectedItem == id) {
      emit(
        currentState.copyWith(
          selectedItem: null,
        ),
      );
      return;
    }

    emit(
      currentState.copyWith(
        selectedItem: id,
        showSettings: false,
      ),
    );
  }

  bool isSelected(String id) {
    if (state is! _Loaded) {
      return false;
    }

    final currentState = state as _Loaded;

    return currentState.selectedItem == id;
  }

  bool isWarning(String id) {
    if (state is! _Loaded) {
      return false;
    }

    final currentState = state as _Loaded;

    final warnings = currentState.task.warnings;

    return warnings.contains(id);
  }

  VisualElement getItem(String id) {
    if (state is! _Loaded) {
      return throw 'Invalid state';
    }

    final currentState = state as _Loaded;

    return currentState.task.sourceUnit.findById(id: id)!;
  }

  void updateItem(VisualElement data) {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;

    final su = currentState.task.sourceUnit;

    final newSu = su.replaceById(id: data.id, element: data);
    if (newSu == null) {
      return;
    }

    final updatedTask = currentState.task.copyWith(
      sourceUnit: newSu as SourceUnit,
    );

    emit(
      currentState.copyWith(
        task: updatedTask,
      ),
    );
  }

  void uploadSourceUnit() async {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;
    try {
      emit(
        const CodeState.initial(isLoading: true),
      );

      final taskId = await repo.uploadSourceUnit(
        currentState.task.id,
        currentState.task.sourceUnit,
      );

      emit(
        CodeState.processing(
          fileBytes: currentState.fileBytes,
          fileName: currentState.fileName,
          taskId: taskId,
          progress: 0,
          message: 'Uploading the smart contract',
        ),
      );
    } catch (e) {
      debugPrint(' Failed to upload file: $e');
      emit(
        currentState,
      );
    }
  }

  void downloadCode() async {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;

    try {
      emit(
        currentState.copyWith(
          isLoading: true,
          justSavedFile: false,
        ),
      );

      await repo.downloadCodeFile(
        currentState.task.id,
        currentState.task.sourceUnit,
      );

      emit(
        currentState.copyWith(
          isLoading: false,
          justSavedFile: true,
        ),
      );
    } catch (e) {
      debugPrint(' Failed to download code: $e');
      emit(
        currentState.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  void downloadDescription() async {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;

    try {
      emit(
        currentState.copyWith(
          isLoading: true,
          justSavedFile: false,
        ),
      );

      await repo.downloadDescription(
        currentState.task.id,
        currentState.task.sourceUnit,
      );

      emit(
        currentState.copyWith(
          isLoading: false,
          justSavedFile: true,
        ),
      );
    } catch (e) {
      debugPrint(' Failed to download description: $e');
      emit(
        currentState.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  void reset() {
    emit(
      const CodeState.initial(),
    );
  }

  void openSettings() {
    if (state is! _Loaded) {
      return;
    }

    final currentState = state as _Loaded;

    if (currentState.showSettings) {
      emit(
        currentState.copyWith(
          showSettings: false,
        ),
      );
      return;
    }

    emit(
      currentState.copyWith(
        showSettings: true,
        selectedItem: null,
      ),
    );
  }

//   void submitTaskId(String taskId) async {
//     if (state is! _Initial) {
//       return;
//     }

//     final currentState = state as _Initial;

//     if (currentState.fileBytes == null) {
//       return;
//     }

//     try {
//       emit(
//         currentState.copyWith(
//           isLoading: true,
//         ),
//       );

//       final response = await repo.verifyTaskId(taskId);

//       emit(
//         CodeState.processing(
//           fileBytes: response.fileBytes,
//           fileName: response.fileName,
//           taskId: response.taskId,
//           progress: 0,
//           message: 'Processing the smart contract',
//         ),
//       );
//     } catch (e) {
//       debugPrint(' Failed to upload file: $e');
//       emit(
//         currentState.copyWith(
//           isLoading: false,
//         ),
//       );
//     }
//   }
}
