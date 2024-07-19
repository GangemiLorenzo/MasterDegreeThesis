// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImportImpl _$$ImportImplFromJson(Map<String, dynamic> json) => _$ImportImpl(
      id: json['id'] as String,
      path: json['path'] as String,
      symbols: (json['symbols'] as List<dynamic>?)
              ?.map((e) => Symbol.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ImportImplToJson(_$ImportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'symbols': instance.symbols,
    };
