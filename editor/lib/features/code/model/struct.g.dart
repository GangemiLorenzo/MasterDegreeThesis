// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'struct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructImpl _$$StructImplFromJson(Map<String, dynamic> json) => _$StructImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => Variable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StructImplToJson(_$StructImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fields': instance.fields,
    };
