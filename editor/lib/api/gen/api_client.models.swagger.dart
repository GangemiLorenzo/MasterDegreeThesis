// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'api_client.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadPost$RequestBody {
  const UploadPost$RequestBody({
    this.file,
  });

  factory UploadPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UploadPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UploadPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UploadPost$RequestBodyToJson(this);

  @JsonKey(name: 'file')
  final String? file;
  static const fromJsonFactory = _$UploadPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $UploadPost$RequestBodyExtension on UploadPost$RequestBody {
  UploadPost$RequestBody copyWith({String? file}) {
    return UploadPost$RequestBody(file: file ?? this.file);
  }

  UploadPost$RequestBody copyWithWrapped({Wrapped<String?>? file}) {
    return UploadPost$RequestBody(
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class UploadPost$Response {
  const UploadPost$Response({
    this.taskId,
  });

  factory UploadPost$Response.fromJson(Map<String, dynamic> json) =>
      _$UploadPost$ResponseFromJson(json);

  static const toJsonFactory = _$UploadPost$ResponseToJson;
  Map<String, dynamic> toJson() => _$UploadPost$ResponseToJson(this);

  @JsonKey(name: 'taskId')
  final String? taskId;
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

  UploadPost$Response copyWithWrapped({Wrapped<String?>? taskId}) {
    return UploadPost$Response(
        taskId: (taskId != null ? taskId.value : this.taskId));
  }
}

@JsonSerializable(explicitToJson: true)
class TasksTaskIdGet$Response {
  const TasksTaskIdGet$Response({
    this.status,
    this.result,
    this.progress,
  });

  factory TasksTaskIdGet$Response.fromJson(Map<String, dynamic> json) =>
      _$TasksTaskIdGet$ResponseFromJson(json);

  static const toJsonFactory = _$TasksTaskIdGet$ResponseToJson;
  Map<String, dynamic> toJson() => _$TasksTaskIdGet$ResponseToJson(this);

  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'result')
  final Object? result;
  @JsonKey(name: 'progress')
  final int? progress;
  static const fromJsonFactory = _$TasksTaskIdGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TasksTaskIdGet$Response &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(progress) ^
      runtimeType.hashCode;
}

extension $TasksTaskIdGet$ResponseExtension on TasksTaskIdGet$Response {
  TasksTaskIdGet$Response copyWith(
      {String? status, Object? result, int? progress}) {
    return TasksTaskIdGet$Response(
        status: status ?? this.status,
        result: result ?? this.result,
        progress: progress ?? this.progress);
  }

  TasksTaskIdGet$Response copyWithWrapped(
      {Wrapped<String?>? status,
      Wrapped<Object?>? result,
      Wrapped<int?>? progress}) {
    return TasksTaskIdGet$Response(
        status: (status != null ? status.value : this.status),
        result: (result != null ? result.value : this.result),
        progress: (progress != null ? progress.value : this.progress));
  }
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
