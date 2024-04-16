// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_setting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalSettingState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalSettingStateCopyWith<GlobalSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingStateCopyWith<$Res> {
  factory $GlobalSettingStateCopyWith(
          GlobalSettingState value, $Res Function(GlobalSettingState) then) =
      _$GlobalSettingStateCopyWithImpl<$Res, GlobalSettingState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$GlobalSettingStateCopyWithImpl<$Res, $Val extends GlobalSettingState>
    implements $GlobalSettingStateCopyWith<$Res> {
  _$GlobalSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalSettingStateImplCopyWith<$Res>
    implements $GlobalSettingStateCopyWith<$Res> {
  factory _$$GlobalSettingStateImplCopyWith(_$GlobalSettingStateImpl value,
          $Res Function(_$GlobalSettingStateImpl) then) =
      __$$GlobalSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$GlobalSettingStateImplCopyWithImpl<$Res>
    extends _$GlobalSettingStateCopyWithImpl<$Res, _$GlobalSettingStateImpl>
    implements _$$GlobalSettingStateImplCopyWith<$Res> {
  __$$GlobalSettingStateImplCopyWithImpl(_$GlobalSettingStateImpl _value,
      $Res Function(_$GlobalSettingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$GlobalSettingStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$GlobalSettingStateImpl implements _GlobalSettingState {
  const _$GlobalSettingStateImpl({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'GlobalSettingState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingStateImplCopyWith<_$GlobalSettingStateImpl> get copyWith =>
      __$$GlobalSettingStateImplCopyWithImpl<_$GlobalSettingStateImpl>(
          this, _$identity);
}

abstract class _GlobalSettingState implements GlobalSettingState {
  const factory _GlobalSettingState({required final ThemeMode themeMode}) =
      _$GlobalSettingStateImpl;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$GlobalSettingStateImplCopyWith<_$GlobalSettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
