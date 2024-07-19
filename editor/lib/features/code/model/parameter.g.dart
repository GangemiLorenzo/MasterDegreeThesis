// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParameterImpl _$$ParameterImplFromJson(Map<String, dynamic> json) =>
    _$ParameterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      storage: json['storage'] as String,
      isIndexed: json['isIndexed'] as bool? ?? false,
      isPayable: json['isPayable'] as bool? ?? false,
    );

Map<String, dynamic> _$$ParameterImplToJson(_$ParameterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'storage': instance.storage,
      'isIndexed': instance.isIndexed,
      'isPayable': instance.isPayable,
    };
