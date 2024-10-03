import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:editor/api/gen/api_client.models.swagger.dart';
import 'package:editor/features/code/model/source_unit.dart';
import 'package:editor/service/file_picker_service.dart';
import 'package:editor/service/rest_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class CodeRepo {
  final RestService restService;
  final FilePickerService filePickerService;

  CodeRepo({
    required this.restService,
    required this.filePickerService,
  });

  Future<PlatformFile?> openSmartContract() async {
    final platformFile = await filePickerService.pickSingleFile(
      allowedExtensions: ['sol'],
    );

    if (platformFile == null) {
      return null;
    }

    if (!kIsWeb) {
      if (platformFile.path == null) {
        return null;
      }
    }

    return platformFile;
  }

  Future<Uint8List> getBytes(PlatformFile platformFile) async {
    if (platformFile.bytes != null) {
      return platformFile.bytes!;
    }

    if (kIsWeb) {
      throw Exception('Failed to get bytes');
    }

    final file = File(platformFile.path!);
    await Future.delayed(const Duration(milliseconds: 500));
    final bytes = await file.readAsBytes();

    return bytes;
  }

  Future<bool> saveSmartContract(String code, String id) async {
    try {
      await FileSaver.instance.saveFile(
        name: 'smart_contract_$id.sol',
        bytes: utf8.encode(code),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> uploadFile({
    required Uint8List fileBytes,
    required String openAIKey,
  }) async {
    //return 'taskId';

    final response = await restService.client.uploadPost(
      file: fileBytes,
      openAiKey: openAIKey,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload file');
    }

    return response.body!.taskId;
  }

  // Future<VerifyTaskIdResponse> verifyTaskId(String taskId) async {
  //   final response = await restService.client.verifyTaskId(taskId: taskId);

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to check task id');
  //   }

  //   return response.body!.taskId;

  //   //return 'taskId';
  // }

  Future<TasksTaskIdGet$Response> getTask(String taskId) async {
    // final jsonString = await rootBundle.loadString('assets/mock_response.json');
    // final jsonMap = json.decode(jsonString);
    // final response = TasksTaskIdGet$Response.fromJson(jsonMap);
    // return response;

    final response = await restService.client.tasksTaskIdGet(
      taskId: taskId,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get task');
    }

    return response.body!;
  }

  Future<String> uploadSourceUnit(String taskId, SourceUnit sourceUnit) async {
    final body = TasksTaskIdPost$RequestBody(
      sourceUnit: sourceUnit.toJson(),
    );

    final response = await restService.client.tasksTaskIdPost(
      taskId: taskId,
      body: body,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload file');
    }

    return response.body!.taskId;
  }

  Future<bool> downloadCodeFile(String taskId, SourceUnit sourceUnit) async {
    final body = ExportTaskIdPost$RequestBody(
      sourceUnit: sourceUnit.toJson(),
    );

    final response = await restService.client.exportTaskIdPost(
      taskId: taskId,
      body: body,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get task');
    }

    final result = await saveSmartContract(response.body!.contractCode, taskId);

    return result;
  }

  Future<bool> downloadDescription(String taskId, SourceUnit sourceUnit) async {
    final description =
        sourceUnit.toDescription.map((e) => e.toPlainText()).join();

    try {
      await FileSaver.instance.saveFile(
        name: 'description_$taskId.txt',
        bytes: utf8.encode(description),
      );
    } catch (e) {
      return false;
    }

    return true;
  }
}

class VerifyTaskIdResponse {
  final String taskId;
  final String fileName;
  final Uint8List fileBytes;

  VerifyTaskIdResponse({
    required this.taskId,
    required this.fileName,
    required this.fileBytes,
  });
}
