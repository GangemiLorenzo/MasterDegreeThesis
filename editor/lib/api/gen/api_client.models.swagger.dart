// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'api_client.enums.swagger.dart' as enums;

part 'api_client.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadPost$RequestBody {
  const UploadPost$RequestBody({
    required this.file,
    required this.openAiKey,
  });

  factory UploadPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UploadPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UploadPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UploadPost$RequestBodyToJson(this);

  @JsonKey(name: 'file')
  final String file;
  @JsonKey(name: 'openAiKey')
  final String openAiKey;
  static const fromJsonFactory = _$UploadPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.openAiKey, openAiKey) ||
                const DeepCollectionEquality()
                    .equals(other.openAiKey, openAiKey)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(openAiKey) ^
      runtimeType.hashCode;
}

extension $UploadPost$RequestBodyExtension on UploadPost$RequestBody {
  UploadPost$RequestBody copyWith({String? file, String? openAiKey}) {
    return UploadPost$RequestBody(
        file: file ?? this.file, openAiKey: openAiKey ?? this.openAiKey);
  }

  UploadPost$RequestBody copyWithWrapped(
      {Wrapped<String>? file, Wrapped<String>? openAiKey}) {
    return UploadPost$RequestBody(
        file: (file != null ? file.value : this.file),
        openAiKey: (openAiKey != null ? openAiKey.value : this.openAiKey));
  }
}

@JsonSerializable(explicitToJson: true)
class ExportTaskIdPost$RequestBody {
  const ExportTaskIdPost$RequestBody({
    this.sourceUnit,
  });

  factory ExportTaskIdPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ExportTaskIdPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ExportTaskIdPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ExportTaskIdPost$RequestBodyToJson(this);

  @JsonKey(name: 'sourceUnit')
  final Object? sourceUnit;
  static const fromJsonFactory = _$ExportTaskIdPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExportTaskIdPost$RequestBody &&
            (identical(other.sourceUnit, sourceUnit) ||
                const DeepCollectionEquality()
                    .equals(other.sourceUnit, sourceUnit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sourceUnit) ^ runtimeType.hashCode;
}

extension $ExportTaskIdPost$RequestBodyExtension
    on ExportTaskIdPost$RequestBody {
  ExportTaskIdPost$RequestBody copyWith({Object? sourceUnit}) {
    return ExportTaskIdPost$RequestBody(
        sourceUnit: sourceUnit ?? this.sourceUnit);
  }

  ExportTaskIdPost$RequestBody copyWithWrapped({Wrapped<Object?>? sourceUnit}) {
    return ExportTaskIdPost$RequestBody(
        sourceUnit: (sourceUnit != null ? sourceUnit.value : this.sourceUnit));
  }
}

@JsonSerializable(explicitToJson: true)
class TasksTaskIdPost$RequestBody {
  const TasksTaskIdPost$RequestBody({
    this.sourceUnit,
  });

  factory TasksTaskIdPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$TasksTaskIdPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$TasksTaskIdPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$TasksTaskIdPost$RequestBodyToJson(this);

  @JsonKey(name: 'sourceUnit')
  final Object? sourceUnit;
  static const fromJsonFactory = _$TasksTaskIdPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TasksTaskIdPost$RequestBody &&
            (identical(other.sourceUnit, sourceUnit) ||
                const DeepCollectionEquality()
                    .equals(other.sourceUnit, sourceUnit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sourceUnit) ^ runtimeType.hashCode;
}

extension $TasksTaskIdPost$RequestBodyExtension on TasksTaskIdPost$RequestBody {
  TasksTaskIdPost$RequestBody copyWith({Object? sourceUnit}) {
    return TasksTaskIdPost$RequestBody(
        sourceUnit: sourceUnit ?? this.sourceUnit);
  }

  TasksTaskIdPost$RequestBody copyWithWrapped({Wrapped<Object?>? sourceUnit}) {
    return TasksTaskIdPost$RequestBody(
        sourceUnit: (sourceUnit != null ? sourceUnit.value : this.sourceUnit));
  }
}

@JsonSerializable(explicitToJson: true)
class UploadPost$Response {
  const UploadPost$Response({
    required this.taskId,
  });

  factory UploadPost$Response.fromJson(Map<String, dynamic> json) =>
      _$UploadPost$ResponseFromJson(json);

  static const toJsonFactory = _$UploadPost$ResponseToJson;
  Map<String, dynamic> toJson() => _$UploadPost$ResponseToJson(this);

  @JsonKey(name: 'taskId')
  final String taskId;
  static const fromJsonFactory = _$UploadPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadPost$Response &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taskId) ^ runtimeType.hashCode;
}

extension $UploadPost$ResponseExtension on UploadPost$Response {
  UploadPost$Response copyWith({String? taskId}) {
    return UploadPost$Response(taskId: taskId ?? this.taskId);
  }

  UploadPost$Response copyWithWrapped({Wrapped<String>? taskId}) {
    return UploadPost$Response(
        taskId: (taskId != null ? taskId.value : this.taskId));
  }
}

@JsonSerializable(explicitToJson: true)
class ExportTaskIdPost$Response {
  const ExportTaskIdPost$Response({
    required this.contractCode,
  });

  factory ExportTaskIdPost$Response.fromJson(Map<String, dynamic> json) =>
      _$ExportTaskIdPost$ResponseFromJson(json);

  static const toJsonFactory = _$ExportTaskIdPost$ResponseToJson;
  Map<String, dynamic> toJson() => _$ExportTaskIdPost$ResponseToJson(this);

  @JsonKey(name: 'contractCode')
  final String contractCode;
  static const fromJsonFactory = _$ExportTaskIdPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExportTaskIdPost$Response &&
            (identical(other.contractCode, contractCode) ||
                const DeepCollectionEquality()
                    .equals(other.contractCode, contractCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(contractCode) ^ runtimeType.hashCode;
}

extension $ExportTaskIdPost$ResponseExtension on ExportTaskIdPost$Response {
  ExportTaskIdPost$Response copyWith({String? contractCode}) {
    return ExportTaskIdPost$Response(
        contractCode: contractCode ?? this.contractCode);
  }

  ExportTaskIdPost$Response copyWithWrapped({Wrapped<String>? contractCode}) {
    return ExportTaskIdPost$Response(
        contractCode:
            (contractCode != null ? contractCode.value : this.contractCode));
  }
}

@JsonSerializable(explicitToJson: true)
class TasksTaskIdGet$Response {
  const TasksTaskIdGet$Response({
    required this.id,
    required this.status,
    this.result,
    this.vulnerabilities,
    this.links,
    this.warnings,
    required this.progress,
    required this.statusMessage,
  });

  factory TasksTaskIdGet$Response.fromJson(Map<String, dynamic> json) =>
      _$TasksTaskIdGet$ResponseFromJson(json);

  static const toJsonFactory = _$TasksTaskIdGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$TasksTaskIdGet$ResponseToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(
    name: 'status',
    toJson: tasksTaskIdGet$ResponseStatusToJson,
    fromJson: tasksTaskIdGet$ResponseStatusFromJson,
  )
  final enums.TasksTaskIdGet$ResponseStatus status;
  @JsonKey(name: 'result')
  final Object? result;
  @JsonKey(name: 'vulnerabilities')
  final Object? vulnerabilities;
  @JsonKey(name: 'links')
  final Object? links;
  @JsonKey(name: 'warnings')
  final Object? warnings;
  @JsonKey(name: 'progress')
  final int progress;
  @JsonKey(name: 'statusMessage')
  final String statusMessage;
  static const fromJsonFactory = _$TasksTaskIdGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TasksTaskIdGet$Response &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.vulnerabilities, vulnerabilities) ||
                const DeepCollectionEquality()
                    .equals(other.vulnerabilities, vulnerabilities)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)) &&
            (identical(other.warnings, warnings) ||
                const DeepCollectionEquality()
                    .equals(other.warnings, warnings)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)) &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(vulnerabilities) ^
      const DeepCollectionEquality().hash(links) ^
      const DeepCollectionEquality().hash(warnings) ^
      const DeepCollectionEquality().hash(progress) ^
      const DeepCollectionEquality().hash(statusMessage) ^
      runtimeType.hashCode;
}

extension $TasksTaskIdGet$ResponseExtension on TasksTaskIdGet$Response {
  TasksTaskIdGet$Response copyWith(
      {String? id,
      enums.TasksTaskIdGet$ResponseStatus? status,
      Object? result,
      Object? vulnerabilities,
      Object? links,
      Object? warnings,
      int? progress,
      String? statusMessage}) {
    return TasksTaskIdGet$Response(
        id: id ?? this.id,
        status: status ?? this.status,
        result: result ?? this.result,
        vulnerabilities: vulnerabilities ?? this.vulnerabilities,
        links: links ?? this.links,
        warnings: warnings ?? this.warnings,
        progress: progress ?? this.progress,
        statusMessage: statusMessage ?? this.statusMessage);
  }

  TasksTaskIdGet$Response copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<enums.TasksTaskIdGet$ResponseStatus>? status,
      Wrapped<Object?>? result,
      Wrapped<Object?>? vulnerabilities,
      Wrapped<Object?>? links,
      Wrapped<Object?>? warnings,
      Wrapped<int>? progress,
      Wrapped<String>? statusMessage}) {
    return TasksTaskIdGet$Response(
        id: (id != null ? id.value : this.id),
        status: (status != null ? status.value : this.status),
        result: (result != null ? result.value : this.result),
        vulnerabilities: (vulnerabilities != null
            ? vulnerabilities.value
            : this.vulnerabilities),
        links: (links != null ? links.value : this.links),
        warnings: (warnings != null ? warnings.value : this.warnings),
        progress: (progress != null ? progress.value : this.progress),
        statusMessage:
            (statusMessage != null ? statusMessage.value : this.statusMessage));
  }
}

@JsonSerializable(explicitToJson: true)
class TasksTaskIdPost$Response {
  const TasksTaskIdPost$Response({
    required this.taskId,
  });

  factory TasksTaskIdPost$Response.fromJson(Map<String, dynamic> json) =>
      _$TasksTaskIdPost$ResponseFromJson(json);

  static const toJsonFactory = _$TasksTaskIdPost$ResponseToJson;
  Map<String, dynamic> toJson() => _$TasksTaskIdPost$ResponseToJson(this);

  @JsonKey(name: 'taskId')
  final String taskId;
  static const fromJsonFactory = _$TasksTaskIdPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TasksTaskIdPost$Response &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taskId) ^ runtimeType.hashCode;
}

extension $TasksTaskIdPost$ResponseExtension on TasksTaskIdPost$Response {
  TasksTaskIdPost$Response copyWith({String? taskId}) {
    return TasksTaskIdPost$Response(taskId: taskId ?? this.taskId);
  }

  TasksTaskIdPost$Response copyWithWrapped({Wrapped<String>? taskId}) {
    return TasksTaskIdPost$Response(
        taskId: (taskId != null ? taskId.value : this.taskId));
  }
}

String? tasksTaskIdGet$ResponseStatusNullableToJson(
    enums.TasksTaskIdGet$ResponseStatus? tasksTaskIdGet$ResponseStatus) {
  return tasksTaskIdGet$ResponseStatus?.value;
}

String? tasksTaskIdGet$ResponseStatusToJson(
    enums.TasksTaskIdGet$ResponseStatus tasksTaskIdGet$ResponseStatus) {
  return tasksTaskIdGet$ResponseStatus.value;
}

enums.TasksTaskIdGet$ResponseStatus tasksTaskIdGet$ResponseStatusFromJson(
  Object? tasksTaskIdGet$ResponseStatus, [
  enums.TasksTaskIdGet$ResponseStatus? defaultValue,
]) {
  return enums.TasksTaskIdGet$ResponseStatus.values
          .firstWhereOrNull((e) => e.value == tasksTaskIdGet$ResponseStatus) ??
      defaultValue ??
      enums.TasksTaskIdGet$ResponseStatus.swaggerGeneratedUnknown;
}

enums.TasksTaskIdGet$ResponseStatus?
    tasksTaskIdGet$ResponseStatusNullableFromJson(
  Object? tasksTaskIdGet$ResponseStatus, [
  enums.TasksTaskIdGet$ResponseStatus? defaultValue,
]) {
  if (tasksTaskIdGet$ResponseStatus == null) {
    return null;
  }
  return enums.TasksTaskIdGet$ResponseStatus.values
          .firstWhereOrNull((e) => e.value == tasksTaskIdGet$ResponseStatus) ??
      defaultValue;
}

String tasksTaskIdGet$ResponseStatusExplodedListToJson(
    List<enums.TasksTaskIdGet$ResponseStatus>? tasksTaskIdGet$ResponseStatus) {
  return tasksTaskIdGet$ResponseStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> tasksTaskIdGet$ResponseStatusListToJson(
    List<enums.TasksTaskIdGet$ResponseStatus>? tasksTaskIdGet$ResponseStatus) {
  if (tasksTaskIdGet$ResponseStatus == null) {
    return [];
  }

  return tasksTaskIdGet$ResponseStatus.map((e) => e.value!).toList();
}

List<enums.TasksTaskIdGet$ResponseStatus>
    tasksTaskIdGet$ResponseStatusListFromJson(
  List? tasksTaskIdGet$ResponseStatus, [
  List<enums.TasksTaskIdGet$ResponseStatus>? defaultValue,
]) {
  if (tasksTaskIdGet$ResponseStatus == null) {
    return defaultValue ?? [];
  }

  return tasksTaskIdGet$ResponseStatus
      .map((e) => tasksTaskIdGet$ResponseStatusFromJson(e.toString()))
      .toList();
}

List<enums.TasksTaskIdGet$ResponseStatus>?
    tasksTaskIdGet$ResponseStatusNullableListFromJson(
  List? tasksTaskIdGet$ResponseStatus, [
  List<enums.TasksTaskIdGet$ResponseStatus>? defaultValue,
]) {
  if (tasksTaskIdGet$ResponseStatus == null) {
    return defaultValue;
  }

  return tasksTaskIdGet$ResponseStatus
      .map((e) => tasksTaskIdGet$ResponseStatusFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
