// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Import _$ImportFromJson(Map<String, dynamic> json) {
  return _Import.fromJson(json);
}

/// @nodoc
mixin _$Import {
  String get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Symbol> get symbols => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportCopyWith<Import> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportCopyWith<$Res> {
  factory $ImportCopyWith(Import value, $Res Function(Import) then) =
      _$ImportCopyWithImpl<$Res, Import>;
  @useResult
  $Res call({String id, String path, List<Symbol> symbols});
}

/// @nodoc
class _$ImportCopyWithImpl<$Res, $Val extends Import>
    implements $ImportCopyWith<$Res> {
  _$ImportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? symbols = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      symbols: null == symbols
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<Symbol>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImportImplCopyWith<$Res> implements $ImportCopyWith<$Res> {
  factory _$$ImportImplCopyWith(
          _$ImportImpl value, $Res Function(_$ImportImpl) then) =
      __$$ImportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String path, List<Symbol> symbols});
}

/// @nodoc
class __$$ImportImplCopyWithImpl<$Res>
    extends _$ImportCopyWithImpl<$Res, _$ImportImpl>
    implements _$$ImportImplCopyWith<$Res> {
  __$$ImportImplCopyWithImpl(
      _$ImportImpl _value, $Res Function(_$ImportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? symbols = null,
  }) {
    return _then(_$ImportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      symbols: null == symbols
          ? _value._symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<Symbol>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportImpl extends _Import {
  const _$ImportImpl(
      {required this.id,
      required this.path,
      final List<Symbol> symbols = const []})
      : _symbols = symbols,
        super._();

  factory _$ImportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
  final List<Symbol> _symbols;
  @override
  @JsonKey()
  List<Symbol> get symbols {
    if (_symbols is EqualUnmodifiableListView) return _symbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symbols);
  }

  @override
  String toString() {
    return 'Import(id: $id, path: $path, symbols: $symbols)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other._symbols, _symbols));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, path, const DeepCollectionEquality().hash(_symbols));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportImplCopyWith<_$ImportImpl> get copyWith =>
      __$$ImportImplCopyWithImpl<_$ImportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportImplToJson(
      this,
    );
  }
}

abstract class _Import extends Import {
  const factory _Import(
      {required final String id,
      required final String path,
      final List<Symbol> symbols}) = _$ImportImpl;
  const _Import._() : super._();

  factory _Import.fromJson(Map<String, dynamic> json) = _$ImportImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override
  List<Symbol> get symbols;
  @override
  @JsonKey(ignore: true)
  _$$ImportImplCopyWith<_$ImportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
