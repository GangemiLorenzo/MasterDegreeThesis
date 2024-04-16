// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavBarState {
  List<NavBarItemModel> get items => throw _privateConstructorUsedError;
  List<NavBarItemModel> get bottomItems => throw _privateConstructorUsedError;
  NavBarItemType get selectedItem => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavBarStateCopyWith<NavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
  @useResult
  $Res call(
      {List<NavBarItemModel> items,
      List<NavBarItemModel> bottomItems,
      NavBarItemType selectedItem});
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? bottomItems = null,
    Object? selectedItem = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NavBarItemModel>,
      bottomItems: null == bottomItems
          ? _value.bottomItems
          : bottomItems // ignore: cast_nullable_to_non_nullable
              as List<NavBarItemModel>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as NavBarItemType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NavBarStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NavBarItemModel> items,
      List<NavBarItemModel> bottomItems,
      NavBarItemType selectedItem});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? bottomItems = null,
    Object? selectedItem = null,
  }) {
    return _then(_$InitialImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NavBarItemModel>,
      bottomItems: null == bottomItems
          ? _value._bottomItems
          : bottomItems // ignore: cast_nullable_to_non_nullable
              as List<NavBarItemModel>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as NavBarItemType,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<NavBarItemModel> items,
      required final List<NavBarItemModel> bottomItems,
      required this.selectedItem})
      : _items = items,
        _bottomItems = bottomItems;

  final List<NavBarItemModel> _items;
  @override
  List<NavBarItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<NavBarItemModel> _bottomItems;
  @override
  List<NavBarItemModel> get bottomItems {
    if (_bottomItems is EqualUnmodifiableListView) return _bottomItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bottomItems);
  }

  @override
  final NavBarItemType selectedItem;

  @override
  String toString() {
    return 'NavBarState.initial(items: $items, bottomItems: $bottomItems, selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._bottomItems, _bottomItems) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_bottomItems),
      selectedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)
        initial,
  }) {
    return initial(items, bottomItems, selectedItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)?
        initial,
  }) {
    return initial?.call(items, bottomItems, selectedItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavBarItemModel> items,
            List<NavBarItemModel> bottomItems, NavBarItemType selectedItem)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(items, bottomItems, selectedItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NavBarState {
  const factory _Initial(
      {required final List<NavBarItemModel> items,
      required final List<NavBarItemModel> bottomItems,
      required final NavBarItemType selectedItem}) = _$InitialImpl;

  @override
  List<NavBarItemModel> get items;
  @override
  List<NavBarItemModel> get bottomItems;
  @override
  NavBarItemType get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
