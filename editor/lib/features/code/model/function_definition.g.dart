// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FunctionDefinitionImpl _$$FunctionDefinitionImplFromJson(
        Map<String, dynamic> json) =>
    _$FunctionDefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      body: json['body'] as String,
      stateMutability: json['stateMutability'] as String,
      description: json['description'] as String,
      isConstructor: json['isConstructor'] as bool? ?? false,
      isFallback: json['isFallback'] as bool? ?? false,
      isReceive: json['isReceive'] as bool? ?? false,
      parameters: (json['parameters'] as List<dynamic>?)
              ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      returns: (json['returns'] as List<dynamic>?)
              ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FunctionDefinitionImplToJson(
        _$FunctionDefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visibility': instance.visibility,
      'body': instance.body,
      'stateMutability': instance.stateMutability,
      'description': instance.description,
      'isConstructor': instance.isConstructor,
      'isFallback': instance.isFallback,
      'isReceive': instance.isReceive,
      'parameters': instance.parameters,
      'returns': instance.returns,
      'modifiers': instance.modifiers,
    };
