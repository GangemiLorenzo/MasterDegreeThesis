// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pragma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pragma _$PragmaFromJson(Map<String, dynamic> json) {
  return _Pragma.fromJson(json);
}

/// @nodoc
mixin _$Pragma {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PragmaCopyWith<Pragma> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PragmaCopyWith<$Res> {
  factory $PragmaCopyWith(Pragma value, $Res Function(Pragma) then) =
      _$PragmaCopyWithImpl<$Res, Pragma>;
  @useResult
  $Res call({String id, String name, String value});
}

/// @nodoc
class _$PragmaCopyWithImpl<$Res, $Val extends Pragma>
    implements $PragmaCopyWith<$Res> {
  _$PragmaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
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
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PragmaImplCopyWith<$Res> implements $PragmaCopyWith<$Res> {
  factory _$$PragmaImplCopyWith(
          _$PragmaImpl value, $Res Function(_$PragmaImpl) then) =
      __$$PragmaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String value});
}

/// @nodoc
class __$$PragmaImplCopyWithImpl<$Res>
    extends _$PragmaCopyWithImpl<$Res, _$PragmaImpl>
    implements _$$PragmaImplCopyWith<$Res> {
  __$$PragmaImplCopyWithImpl(
      _$PragmaImpl _value, $Res Function(_$PragmaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$PragmaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PragmaImpl extends _Pragma {
  const _$PragmaImpl(
      {required this.id, required this.name, required this.value})
      : super._();

  factory _$PragmaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PragmaImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String value;

  @override
  String toString() {
    return 'Pragma(id: $id, name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PragmaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PragmaImplCopyWith<_$PragmaImpl> get copyWith =>
      __$$PragmaImplCopyWithImpl<_$PragmaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PragmaImplToJson(
      this,
    );
  }
}

abstract class _Pragma extends Pragma {
  const factory _Pragma(
      {required final String id,
      required final String name,
      required final String value}) = _$PragmaImpl;
  const _Pragma._() : super._();

  factory _Pragma.fromJson(Map<String, dynamic> json) = _$PragmaImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$PragmaImplCopyWith<_$PragmaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
