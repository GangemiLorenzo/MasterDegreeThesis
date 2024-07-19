// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inheritance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InheritanceImpl _$$InheritanceImplFromJson(Map<String, dynamic> json) =>
    _$InheritanceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InheritanceImplToJson(_$InheritanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'values': instance.values,
    };
