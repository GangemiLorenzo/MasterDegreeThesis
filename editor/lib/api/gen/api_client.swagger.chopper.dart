// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiClient extends ApiClient {
  _$ApiClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiClient;

  @override
  Future<Response<UploadPost$Response>> _uploadPost({List<int>? file}) {
    final Uri $url = Uri.parse('/upload');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'file',
        file,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<UploadPost$Response, UploadPost$Response>($request);
  }

  @override
  Future<Response<TasksTaskIdGet$Response>> _tasksTaskIdGet(
      {required String? taskId}) {
    final Uri $url = Uri.parse('/tasks/${taskId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<TasksTaskIdGet$Response, TasksTaskIdGet$Response>($request);
  }
}
