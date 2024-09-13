import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.freezed.dart';
part 'link.g.dart';

@freezed
class Link with _$Link {
  const Link._();

  const factory Link({
    required String start,
    required String end,
    required String action,
    required String description,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  LinkPair toLinkPair() => LinkPair(
        startId: start,
        endId: end,
        operation: action,
        description: description,
        color: Colors.orange.withOpacity(0.7),
      );
}
