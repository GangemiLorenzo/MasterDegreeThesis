part of 'navbar_cubit.dart';

@freezed
class NavBarState with _$NavBarState {
  const factory NavBarState.initial({
    required List<NavBarItemModel> items,
    required List<NavBarItemModel> bottomItems,
    required NavBarItemType selectedItem,
  }) = _Initial;
}
