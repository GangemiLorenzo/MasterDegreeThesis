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
  Future<Response<UploadPost$Response>> _uploadPost({
    required List<int> file,
    required String? openAiKey,
  }) {
    final Uri $url = Uri.parse('/upload');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'openAiKey',
        openAiKey,
      ),
      PartValueFile<List<int>>(
        'file',
        file,
      ),
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
  Future<Response<DownloadTaskIdPost$Response>> _downloadTaskIdPost({
    required String? taskId,
    required DownloadTaskIdPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/download/${taskId}');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<DownloadTaskIdPost$Response,
        DownloadTaskIdPost$Response>($request);
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

  @override
  Future<Response<TasksTaskIdPost$Response>> _tasksTaskIdPost({
    required String? taskId,
    required TasksTaskIdPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/tasks/${taskId}');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<TasksTaskIdPost$Response, TasksTaskIdPost$Response>($request);
  }
}
