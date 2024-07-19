// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnumDefinition _$EnumDefinitionFromJson(Map<String, dynamic> json) {
  return _EnumDefinition.fromJson(json);
}

/// @nodoc
mixin _$EnumDefinition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnumDefinitionCopyWith<EnumDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnumDefinitionCopyWith<$Res> {
  factory $EnumDefinitionCopyWith(
          EnumDefinition value, $Res Function(EnumDefinition) then) =
      _$EnumDefinitionCopyWithImpl<$Res, EnumDefinition>;
  @useResult
  $Res call({String id, String name, List<String> values});
}

/// @nodoc
class _$EnumDefinitionCopyWithImpl<$Res, $Val extends EnumDefinition>
    implements $EnumDefinitionCopyWith<$Res> {
  _$EnumDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnumDefinitionImplCopyWith<$Res>
    implements $EnumDefinitionCopyWith<$Res> {
  factory _$$EnumDefinitionImplCopyWith(_$EnumDefinitionImpl value,
          $Res Function(_$EnumDefinitionImpl) then) =
      __$$EnumDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<String> values});
}

/// @nodoc
class __$$EnumDefinitionImplCopyWithImpl<$Res>
    extends _$EnumDefinitionCopyWithImpl<$Res, _$EnumDefinitionImpl>
    implements _$$EnumDefinitionImplCopyWith<$Res> {
  __$$EnumDefinitionImplCopyWithImpl(
      _$EnumDefinitionImpl _value, $Res Function(_$EnumDefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? values = null,
  }) {
    return _then(_$EnumDefinitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnumDefinitionImpl extends _EnumDefinition {
  const _$EnumDefinitionImpl(
      {required this.id,
      required this.name,
      final List<String> values = const []})
      : _values = values,
        super._();

  factory _$EnumDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnumDefinitionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _values;
  @override
  @JsonKey()
  List<String> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'EnumDefinition(id: $id, name: $name, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnumDefinitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnumDefinitionImplCopyWith<_$EnumDefinitionImpl> get copyWith =>
      __$$EnumDefinitionImplCopyWithImpl<_$EnumDefinitionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnumDefinitionImplToJson(
      this,
    );
  }
}

abstract class _EnumDefinition extends EnumDefinition {
  const factory _EnumDefinition(
      {required final String id,
      required final String name,
      final List<String> values}) = _$EnumDefinitionImpl;
  const _EnumDefinition._() : super._();

  factory _EnumDefinition.fromJson(Map<String, dynamic> json) =
      _$EnumDefinitionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get values;
  @override
  @JsonKey(ignore: true)
  _$$EnumDefinitionImplCopyWith<_$EnumDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
