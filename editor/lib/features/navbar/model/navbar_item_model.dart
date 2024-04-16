import 'package:editor/features/navbar/model/navbar_item_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_item_model.freezed.dart';

@freezed
class NavBarItemModel with _$NavBarItemModel {
  const factory NavBarItemModel({
    required NavBarItemType type,
    required String route,
    required IconData icon,
  }) = _NavBarItemModel;
}
