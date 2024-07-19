// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomErrorImpl _$$CustomErrorImplFromJson(Map<String, dynamic> json) =>
    _$CustomErrorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      parameters: (json['parameters'] as List<dynamic>?)
              ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CustomErrorImplToJson(_$CustomErrorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parameters': instance.parameters,
    };
