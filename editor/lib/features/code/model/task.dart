import 'package:editor/features/code/model/link.dart';
import 'package:editor/features/code/model/source_unit.dart';
import 'package:editor/features/code/model/vulnerability.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required SourceUnit sourceUnit,
    required List<Link> links,
    required List<Vulnerability> vulnerabilities,
  }) = _Task;
}
