// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPost$RequestBody _$UploadPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    UploadPost$RequestBody(
      file: json['file'] as String,
      openAiKey: json['openAiKey'] as String,
    );

Map<String, dynamic> _$UploadPost$RequestBodyToJson(
        UploadPost$RequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
      'openAiKey': instance.openAiKey,
    };

DownloadTaskIdPost$RequestBody _$DownloadTaskIdPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    DownloadTaskIdPost$RequestBody(
      sourceUnit: json['sourceUnit'],
    );

Map<String, dynamic> _$DownloadTaskIdPost$RequestBodyToJson(
        DownloadTaskIdPost$RequestBody instance) =>
    <String, dynamic>{
      'sourceUnit': instance.sourceUnit,
    };

TasksTaskIdPost$RequestBody _$TasksTaskIdPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    TasksTaskIdPost$RequestBody(
      sourceUnit: json['sourceUnit'],
    );

Map<String, dynamic> _$TasksTaskIdPost$RequestBodyToJson(
        TasksTaskIdPost$RequestBody instance) =>
    <String, dynamic>{
      'sourceUnit': instance.sourceUnit,
    };

UploadPost$Response _$UploadPost$ResponseFromJson(Map<String, dynamic> json) =>
    UploadPost$Response(
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$UploadPost$ResponseToJson(
        UploadPost$Response instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
    };

DownloadTaskIdPost$Response _$DownloadTaskIdPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    DownloadTaskIdPost$Response(
      contractCode: json['contractCode'] as String,
    );

Map<String, dynamic> _$DownloadTaskIdPost$ResponseToJson(
        DownloadTaskIdPost$Response instance) =>
    <String, dynamic>{
      'contractCode': instance.contractCode,
    };

TasksTaskIdGet$Response _$TasksTaskIdGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    TasksTaskIdGet$Response(
      id: json['id'] as String,
      status: tasksTaskIdGet$ResponseStatusFromJson(json['status']),
      result: json['result'],
      vulnerabilities: json['vulnerabilities'],
      links: json['links'],
      progress: json['progress'] as int,
      statusMessage: json['statusMessage'] as String,
    );

Map<String, dynamic> _$TasksTaskIdGet$ResponseToJson(
        TasksTaskIdGet$Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': tasksTaskIdGet$ResponseStatusToJson(instance.status),
      'result': instance.result,
      'vulnerabilities': instance.vulnerabilities,
      'links': instance.links,
      'progress': instance.progress,
      'statusMessage': instance.statusMessage,
    };

TasksTaskIdPost$Response _$TasksTaskIdPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    TasksTaskIdPost$Response(
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$TasksTaskIdPost$ResponseToJson(
        TasksTaskIdPost$Response instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
    };
