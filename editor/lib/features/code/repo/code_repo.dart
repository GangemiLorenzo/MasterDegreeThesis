import 'dart:io';

import 'package:editor/service/file_picker_service.dart';
import 'package:editor/service/rest_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class CodeRepo {
  final RestService restService;
  final FilePickerService filePickerService;

  CodeRepo({
    required this.restService,
    required this.filePickerService,
  });

  Future<File?> openSmartContract() async {
    final platformFile = await filePickerService.pickSingleFile(
      allowedExtensions: ['sol'],
    );
    if (platformFile == null || platformFile.path == null) {
      return null;
    }
    return File(platformFile.path!);
  }

  Future<String> uploadFile(File file) async {
    final fileBytes = await file.readAsBytes();

    final response = await restService.client.uploadPost(file: fileBytes);

    if (response.statusCode != 200) {
      throw Exception('Failed to upload file');
    }

    return response.body!.taskId;
  }
}
