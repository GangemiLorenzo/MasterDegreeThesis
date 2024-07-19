// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourceUnitImpl _$$SourceUnitImplFromJson(Map<String, dynamic> json) =>
    _$SourceUnitImpl(
      id: json['id'] as String,
      pragmas: (json['pragmas'] as List<dynamic>?)
              ?.map((e) => Pragma.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contracts: (json['contracts'] as List<dynamic>?)
              ?.map((e) => Contract.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imports: (json['imports'] as List<dynamic>?)
              ?.map((e) => Import.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      enums: (json['enums'] as List<dynamic>?)
              ?.map((e) => EnumDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      structs: (json['structs'] as List<dynamic>?)
              ?.map((e) => Struct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      functions: (json['functions'] as List<dynamic>?)
              ?.map(
                  (e) => FunctionDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => CustomError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SourceUnitImplToJson(_$SourceUnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pragmas': instance.pragmas,
      'contracts': instance.contracts,
      'imports': instance.imports,
      'enums': instance.enums,
      'events': instance.events,
      'structs': instance.structs,
      'functions': instance.functions,
      'errors': instance.errors,
    };
