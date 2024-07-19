// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnumDefinitionImpl _$$EnumDefinitionImplFromJson(Map<String, dynamic> json) =>
    _$EnumDefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EnumDefinitionImplToJson(
        _$EnumDefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'values': instance.values,
    };
