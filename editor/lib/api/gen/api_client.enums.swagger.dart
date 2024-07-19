import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum TasksTaskIdGet$ResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('processing')
  processing('processing'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const TasksTaskIdGet$ResponseStatus(this.value);
}
