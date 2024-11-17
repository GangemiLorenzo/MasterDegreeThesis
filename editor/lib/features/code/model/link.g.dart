// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkImpl _$$LinkImplFromJson(Map<String, dynamic> json) => _$LinkImpl(
      start: json['Start'] as String,
      end: json['End'] as String,
      action: json['Action'] as String,
      description: json['Description'] as String,
    );

Map<String, dynamic> _$$LinkImplToJson(_$LinkImpl instance) =>
    <String, dynamic>{
      'Start': instance.start,
      'End': instance.end,
      'Action': instance.action,
      'Description': instance.description,
    };
