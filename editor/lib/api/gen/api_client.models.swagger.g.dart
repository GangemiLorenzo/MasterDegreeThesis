// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPost$RequestBody _$UploadPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    UploadPost$RequestBody(
      file: json['file'] as String?,
    );

Map<String, dynamic> _$UploadPost$RequestBodyToJson(
        UploadPost$RequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

UploadPost$Response _$UploadPost$ResponseFromJson(Map<String, dynamic> json) =>
    UploadPost$Response(
      taskId: json['taskId'] as String?,
    );

Map<String, dynamic> _$UploadPost$ResponseToJson(
        UploadPost$Response instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
    };

TasksTaskIdGet$Response _$TasksTaskIdGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    TasksTaskIdGet$Response(
      status: json['status'] as String?,
      result: json['result'],
      progress: json['progress'] as int?,
    );

Map<String, dynamic> _$TasksTaskIdGet$ResponseToJson(
        TasksTaskIdGet$Response instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'progress': instance.progress,
    };
