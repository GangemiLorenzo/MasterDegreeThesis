// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractImpl _$$ContractImplFromJson(Map<String, dynamic> json) =>
    _$ContractImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isInterface: json['isInterface'] as bool? ?? false,
      isLibrary: json['isLibrary'] as bool? ?? false,
      variables: (json['variables'] as List<dynamic>?)
              ?.map((e) => Variable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      functions: (json['functions'] as List<dynamic>?)
              ?.map(
                  (e) => FunctionDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => Modifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      inheritance: (json['inheritance'] as List<dynamic>?)
              ?.map((e) => Inheritance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      enums: (json['enums'] as List<dynamic>?)
              ?.map((e) => EnumDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      structs: (json['structs'] as List<dynamic>?)
              ?.map((e) => Struct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => CustomError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContractImplToJson(_$ContractImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isInterface': instance.isInterface,
      'isLibrary': instance.isLibrary,
      'variables': instance.variables,
      'functions': instance.functions,
      'modifiers': instance.modifiers,
      'events': instance.events,
      'inheritance': instance.inheritance,
      'enums': instance.enums,
      'structs': instance.structs,
      'errors': instance.errors,
    };
