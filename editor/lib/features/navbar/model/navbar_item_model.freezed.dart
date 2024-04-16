// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navbar_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavBarItemModel {
  NavBarItemType get type => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavBarItemModelCopyWith<NavBarItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarItemModelCopyWith<$Res> {
  factory $NavBarItemModelCopyWith(
          NavBarItemModel value, $Res Function(NavBarItemModel) then) =
      _$NavBarItemModelCopyWithImpl<$Res, NavBarItemModel>;
  @useResult
  $Res call({NavBarItemType type, String route, IconData icon});
}

/// @nodoc
class _$NavBarItemModelCopyWithImpl<$Res, $Val extends NavBarItemModel>
    implements $NavBarItemModelCopyWith<$Res> {
  _$NavBarItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? route = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NavBarItemType,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavBarItemModelImplCopyWith<$Res>
    implements $NavBarItemModelCopyWith<$Res> {
  factory _$$NavBarItemModelImplCopyWith(_$NavBarItemModelImpl value,
          $Res Function(_$NavBarItemModelImpl) then) =
      __$$NavBarItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NavBarItemType type, String route, IconData icon});
}

/// @nodoc
class __$$NavBarItemModelImplCopyWithImpl<$Res>
    extends _$NavBarItemModelCopyWithImpl<$Res, _$NavBarItemModelImpl>
    implements _$$NavBarItemModelImplCopyWith<$Res> {
  __$$NavBarItemModelImplCopyWithImpl(
      _$NavBarItemModelImpl _value, $Res Function(_$NavBarItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? route = null,
    Object? icon = null,
  }) {
    return _then(_$NavBarItemModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NavBarItemType,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$NavBarItemModelImpl implements _NavBarItemModel {
  const _$NavBarItemModelImpl(
      {required this.type, required this.route, required this.icon});

  @override
  final NavBarItemType type;
  @override
  final String route;
  @override
  final IconData icon;

  @override
  String toString() {
    return 'NavBarItemModel(type: $type, route: $route, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavBarItemModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, route, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavBarItemModelImplCopyWith<_$NavBarItemModelImpl> get copyWith =>
      __$$NavBarItemModelImplCopyWithImpl<_$NavBarItemModelImpl>(
          this, _$identity);
}

abstract class _NavBarItemModel implements NavBarItemModel {
  const factory _NavBarItemModel(
      {required final NavBarItemType type,
      required final String route,
      required final IconData icon}) = _$NavBarItemModelImpl;

  @override
  NavBarItemType get type;
  @override
  String get route;
  @override
  IconData get icon;
  @override
  @JsonKey(ignore: true)
  _$$NavBarItemModelImplCopyWith<_$NavBarItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
