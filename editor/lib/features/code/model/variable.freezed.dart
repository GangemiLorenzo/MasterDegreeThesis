// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return _Variable.fromJson(json);
}

/// @nodoc
mixin _$Variable {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  String get mappingFrom => throw _privateConstructorUsedError;
  String get mappingTo => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  List<String> get modifiers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariableCopyWith<Variable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariableCopyWith<$Res> {
  factory $VariableCopyWith(Variable value, $Res Function(Variable) then) =
      _$VariableCopyWithImpl<$Res, Variable>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String visibility,
      String mappingFrom,
      String mappingTo,
      String value,
      List<String> modifiers});
}

/// @nodoc
class _$VariableCopyWithImpl<$Res, $Val extends Variable>
    implements $VariableCopyWith<$Res> {
  _$VariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? visibility = null,
    Object? mappingFrom = null,
    Object? mappingTo = null,
    Object? value = null,
    Object? modifiers = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      mappingFrom: null == mappingFrom
          ? _value.mappingFrom
          : mappingFrom // ignore: cast_nullable_to_non_nullable
              as String,
      mappingTo: null == mappingTo
          ? _value.mappingTo
          : mappingTo // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariableImplCopyWith<$Res>
    implements $VariableCopyWith<$Res> {
  factory _$$VariableImplCopyWith(
          _$VariableImpl value, $Res Function(_$VariableImpl) then) =
      __$$VariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String visibility,
      String mappingFrom,
      String mappingTo,
      String value,
      List<String> modifiers});
}

/// @nodoc
class __$$VariableImplCopyWithImpl<$Res>
    extends _$VariableCopyWithImpl<$Res, _$VariableImpl>
    implements _$$VariableImplCopyWith<$Res> {
  __$$VariableImplCopyWithImpl(
      _$VariableImpl _value, $Res Function(_$VariableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? visibility = null,
    Object? mappingFrom = null,
    Object? mappingTo = null,
    Object? value = null,
    Object? modifiers = null,
  }) {
    return _then(_$VariableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      mappingFrom: null == mappingFrom
          ? _value.mappingFrom
          : mappingFrom // ignore: cast_nullable_to_non_nullable
              as String,
      mappingTo: null == mappingTo
          ? _value.mappingTo
          : mappingTo // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariableImpl extends _Variable {
  const _$VariableImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.visibility,
      required this.mappingFrom,
      required this.mappingTo,
      required this.value,
      final List<String> modifiers = const []})
      : _modifiers = modifiers,
        super._();

  factory _$VariableImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariableImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String visibility;
  @override
  final String mappingFrom;
  @override
  final String mappingTo;
  @override
  final String value;
  final List<String> _modifiers;
  @override
  @JsonKey()
  List<String> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  String toString() {
    return 'Variable(id: $id, name: $name, type: $type, visibility: $visibility, mappingFrom: $mappingFrom, mappingTo: $mappingTo, value: $value, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariableImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.mappingFrom, mappingFrom) ||
                other.mappingFrom == mappingFrom) &&
            (identical(other.mappingTo, mappingTo) ||
                other.mappingTo == mappingTo) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      visibility,
      mappingFrom,
      mappingTo,
      value,
      const DeepCollectionEquality().hash(_modifiers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariableImplCopyWith<_$VariableImpl> get copyWith =>
      __$$VariableImplCopyWithImpl<_$VariableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariableImplToJson(
      this,
    );
  }
}

abstract class _Variable extends Variable {
  const factory _Variable(
      {required final String id,
      required final String name,
      required final String type,
      required final String visibility,
      required final String mappingFrom,
      required final String mappingTo,
      required final String value,
      final List<String> modifiers}) = _$VariableImpl;
  const _Variable._() : super._();

  factory _Variable.fromJson(Map<String, dynamic> json) =
      _$VariableImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get visibility;
  @override
  String get mappingFrom;
  @override
  String get mappingTo;
  @override
  String get value;
  @override
  List<String> get modifiers;
  @override
  @JsonKey(ignore: true)
  _$$VariableImplCopyWith<_$VariableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
