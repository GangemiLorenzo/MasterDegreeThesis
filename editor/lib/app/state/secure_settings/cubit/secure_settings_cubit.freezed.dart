// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secure_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SecureSettingsState {
  String get openAIKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecureSettingsStateCopyWith<SecureSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecureSettingsStateCopyWith<$Res> {
  factory $SecureSettingsStateCopyWith(
          SecureSettingsState value, $Res Function(SecureSettingsState) then) =
      _$SecureSettingsStateCopyWithImpl<$Res, SecureSettingsState>;
  @useResult
  $Res call({String openAIKey});
}

/// @nodoc
class _$SecureSettingsStateCopyWithImpl<$Res, $Val extends SecureSettingsState>
    implements $SecureSettingsStateCopyWith<$Res> {
  _$SecureSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openAIKey = null,
  }) {
    return _then(_value.copyWith(
      openAIKey: null == openAIKey
          ? _value.openAIKey
          : openAIKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecureSettingsStateImplCopyWith<$Res>
    implements $SecureSettingsStateCopyWith<$Res> {
  factory _$$SecureSettingsStateImplCopyWith(_$SecureSettingsStateImpl value,
          $Res Function(_$SecureSettingsStateImpl) then) =
      __$$SecureSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String openAIKey});
}

/// @nodoc
class __$$SecureSettingsStateImplCopyWithImpl<$Res>
    extends _$SecureSettingsStateCopyWithImpl<$Res, _$SecureSettingsStateImpl>
    implements _$$SecureSettingsStateImplCopyWith<$Res> {
  __$$SecureSettingsStateImplCopyWithImpl(_$SecureSettingsStateImpl _value,
      $Res Function(_$SecureSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openAIKey = null,
  }) {
    return _then(_$SecureSettingsStateImpl(
      openAIKey: null == openAIKey
          ? _value.openAIKey
          : openAIKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SecureSettingsStateImpl implements _SecureSettingsState {
  const _$SecureSettingsStateImpl({required this.openAIKey});

  @override
  final String openAIKey;

  @override
  String toString() {
    return 'SecureSettingsState(openAIKey: $openAIKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecureSettingsStateImpl &&
            (identical(other.openAIKey, openAIKey) ||
                other.openAIKey == openAIKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, openAIKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecureSettingsStateImplCopyWith<_$SecureSettingsStateImpl> get copyWith =>
      __$$SecureSettingsStateImplCopyWithImpl<_$SecureSettingsStateImpl>(
          this, _$identity);
}

abstract class _SecureSettingsState implements SecureSettingsState {
  const factory _SecureSettingsState({required final String openAIKey}) =
      _$SecureSettingsStateImpl;

  @override
  String get openAIKey;
  @override
  @JsonKey(ignore: true)
  _$$SecureSettingsStateImplCopyWith<_$SecureSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
