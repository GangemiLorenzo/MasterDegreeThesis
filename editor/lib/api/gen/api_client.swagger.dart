// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'api_client.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'api_client.enums.swagger.dart' as enums;
export 'api_client.enums.swagger.dart';
export 'api_client.models.swagger.dart';

part 'api_client.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiClient extends ChopperService {
  static ApiClient create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$ApiClient(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiClient()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$ApiClient(newClient);
  }

  ///Upload a file for processing
  Future<chopper.Response<UploadPost$Response>> uploadPost({List<int>? file}) {
    generatedMapping.putIfAbsent(
        UploadPost$Response, () => UploadPost$Response.fromJsonFactory);

    return _uploadPost(file: file);
  }

  ///Upload a file for processing
  @Post(
    path: '/upload',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<UploadPost$Response>> _uploadPost(
      {@PartFile() List<int>? file});

  ///Post the new Source unit into the task
  ///@param taskId Identifier of the task to get status for
  Future<chopper.Response<DownloadTaskIdPost$Response>> downloadTaskIdPost({
    required String? taskId,
    required DownloadTaskIdPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(DownloadTaskIdPost$Response,
        () => DownloadTaskIdPost$Response.fromJsonFactory);

    return _downloadTaskIdPost(taskId: taskId, body: body);
  }

  ///Post the new Source unit into the task
  ///@param taskId Identifier of the task to get status for
  @Post(
    path: '/download/{taskId}',
    optionalBody: true,
  )
  Future<chopper.Response<DownloadTaskIdPost$Response>> _downloadTaskIdPost({
    @Path('taskId') required String? taskId,
    @Body() required DownloadTaskIdPost$RequestBody? body,
  });

  ///Get the status of a processing task
  ///@param taskId Identifier of the task to get status for
  Future<chopper.Response<TasksTaskIdGet$Response>> tasksTaskIdGet(
      {required String? taskId}) {
    generatedMapping.putIfAbsent(
        TasksTaskIdGet$Response, () => TasksTaskIdGet$Response.fromJsonFactory);

    return _tasksTaskIdGet(taskId: taskId);
  }

  ///Get the status of a processing task
  ///@param taskId Identifier of the task to get status for
  @Get(path: '/tasks/{taskId}')
  Future<chopper.Response<TasksTaskIdGet$Response>> _tasksTaskIdGet(
      {@Path('taskId') required String? taskId});

  ///Post the new Source unit into the task
  ///@param taskId Identifier of the task to get status for
  Future<chopper.Response<TasksTaskIdPost$Response>> tasksTaskIdPost({
    required String? taskId,
    required TasksTaskIdPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(TasksTaskIdPost$Response,
        () => TasksTaskIdPost$Response.fromJsonFactory);

    return _tasksTaskIdPost(taskId: taskId, body: body);
  }

  ///Post the new Source unit into the task
  ///@param taskId Identifier of the task to get status for
  @Post(
    path: '/tasks/{taskId}',
    optionalBody: true,
  )
  Future<chopper.Response<TasksTaskIdPost$Response>> _tasksTaskIdPost({
    @Path('taskId') required String? taskId,
    @Body() required TasksTaskIdPost$RequestBody? body,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
