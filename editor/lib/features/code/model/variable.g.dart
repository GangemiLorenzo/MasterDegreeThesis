// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariableImpl _$$VariableImplFromJson(Map<String, dynamic> json) =>
    _$VariableImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      visibility: json['visibility'] as String,
      mappingFrom: json['mappingFrom'] as String,
      mappingTo: json['mappingTo'] as String,
      value: json['value'] as String,
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VariableImplToJson(_$VariableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'visibility': instance.visibility,
      'mappingFrom': instance.mappingFrom,
      'mappingTo': instance.mappingTo,
      'value': instance.value,
      'modifiers': instance.modifiers,
    };
