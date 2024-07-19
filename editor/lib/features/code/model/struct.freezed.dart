// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'struct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Struct _$StructFromJson(Map<String, dynamic> json) {
  return _Struct.fromJson(json);
}

/// @nodoc
mixin _$Struct {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Variable> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StructCopyWith<Struct> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructCopyWith<$Res> {
  factory $StructCopyWith(Struct value, $Res Function(Struct) then) =
      _$StructCopyWithImpl<$Res, Struct>;
  @useResult
  $Res call({String id, String name, List<Variable> fields});
}

/// @nodoc
class _$StructCopyWithImpl<$Res, $Val extends Struct>
    implements $StructCopyWith<$Res> {
  _$StructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
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
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructImplCopyWith<$Res> implements $StructCopyWith<$Res> {
  factory _$$StructImplCopyWith(
          _$StructImpl value, $Res Function(_$StructImpl) then) =
      __$$StructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<Variable> fields});
}

/// @nodoc
class __$$StructImplCopyWithImpl<$Res>
    extends _$StructCopyWithImpl<$Res, _$StructImpl>
    implements _$$StructImplCopyWith<$Res> {
  __$$StructImplCopyWithImpl(
      _$StructImpl _value, $Res Function(_$StructImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
  }) {
    return _then(_$StructImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructImpl extends _Struct {
  const _$StructImpl(
      {required this.id,
      required this.name,
      final List<Variable> fields = const []})
      : _fields = fields,
        super._();

  factory _$StructImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Variable> _fields;
  @override
  @JsonKey()
  List<Variable> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'Struct(id: $id, name: $name, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StructImplCopyWith<_$StructImpl> get copyWith =>
      __$$StructImplCopyWithImpl<_$StructImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructImplToJson(
      this,
    );
  }
}

abstract class _Struct extends Struct {
  const factory _Struct(
      {required final String id,
      required final String name,
      final List<Variable> fields}) = _$StructImpl;
  const _Struct._() : super._();

  factory _Struct.fromJson(Map<String, dynamic> json) = _$StructImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Variable> get fields;
  @override
  @JsonKey(ignore: true)
  _$$StructImplCopyWith<_$StructImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
