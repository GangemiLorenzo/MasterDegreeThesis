// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  SourceUnit get sourceUnit => throw _privateConstructorUsedError;
  List<Link> get links => throw _privateConstructorUsedError;
  List<String> get warnings => throw _privateConstructorUsedError;
  List<Vulnerability> get vulnerabilities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      SourceUnit sourceUnit,
      List<Link> links,
      List<String> warnings,
      List<Vulnerability> vulnerabilities});

  $SourceUnitCopyWith<$Res> get sourceUnit;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceUnit = null,
    Object? links = null,
    Object? warnings = null,
    Object? vulnerabilities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUnit: null == sourceUnit
          ? _value.sourceUnit
          : sourceUnit // ignore: cast_nullable_to_non_nullable
              as SourceUnit,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
      warnings: null == warnings
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vulnerabilities: null == vulnerabilities
          ? _value.vulnerabilities
          : vulnerabilities // ignore: cast_nullable_to_non_nullable
              as List<Vulnerability>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceUnitCopyWith<$Res> get sourceUnit {
    return $SourceUnitCopyWith<$Res>(_value.sourceUnit, (value) {
      return _then(_value.copyWith(sourceUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SourceUnit sourceUnit,
      List<Link> links,
      List<String> warnings,
      List<Vulnerability> vulnerabilities});

  @override
  $SourceUnitCopyWith<$Res> get sourceUnit;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceUnit = null,
    Object? links = null,
    Object? warnings = null,
    Object? vulnerabilities = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUnit: null == sourceUnit
          ? _value.sourceUnit
          : sourceUnit // ignore: cast_nullable_to_non_nullable
              as SourceUnit,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
      warnings: null == warnings
          ? _value._warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vulnerabilities: null == vulnerabilities
          ? _value._vulnerabilities
          : vulnerabilities // ignore: cast_nullable_to_non_nullable
              as List<Vulnerability>,
    ));
  }
}

/// @nodoc

class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.sourceUnit,
      required final List<Link> links,
      required final List<String> warnings,
      required final List<Vulnerability> vulnerabilities})
      : _links = links,
        _warnings = warnings,
        _vulnerabilities = vulnerabilities;

  @override
  final String id;
  @override
  final SourceUnit sourceUnit;
  final List<Link> _links;
  @override
  List<Link> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  final List<String> _warnings;
  @override
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  final List<Vulnerability> _vulnerabilities;
  @override
  List<Vulnerability> get vulnerabilities {
    if (_vulnerabilities is EqualUnmodifiableListView) return _vulnerabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vulnerabilities);
  }

  @override
  String toString() {
    return 'Task(id: $id, sourceUnit: $sourceUnit, links: $links, warnings: $warnings, vulnerabilities: $vulnerabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceUnit, sourceUnit) ||
                other.sourceUnit == sourceUnit) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            const DeepCollectionEquality()
                .equals(other._vulnerabilities, _vulnerabilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sourceUnit,
      const DeepCollectionEquality().hash(_links),
      const DeepCollectionEquality().hash(_warnings),
      const DeepCollectionEquality().hash(_vulnerabilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final SourceUnit sourceUnit,
      required final List<Link> links,
      required final List<String> warnings,
      required final List<Vulnerability> vulnerabilities}) = _$TaskImpl;

  @override
  String get id;
  @override
  SourceUnit get sourceUnit;
  @override
  List<Link> get links;
  @override
  List<String> get warnings;
  @override
  List<Vulnerability> get vulnerabilities;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
