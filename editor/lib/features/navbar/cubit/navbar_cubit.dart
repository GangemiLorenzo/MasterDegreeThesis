import 'package:editor/app/router/local_router.dart';
import 'package:editor/features/navbar/model/navbar_item_model.dart';
import 'package:editor/features/navbar/model/navbar_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'navbar_cubit.freezed.dart';
part 'navbar_state.dart';

const List<NavBarItemModel> _defaultNavBarItems = [
  NavBarItemModel(
    type: NavBarItemType.code,
    route: 'code',
    icon: Icons.code,
  ),
  // NavBarItemModel(
  //   type: NavBarItemType.contracts,
  //   route: 'contract',
  //   icon: Icons.document_scanner_outlined,
  // ),
  // NavBarItemModel(
  //   type: NavBarItemType.deploy,
  //   route: 'deploy',
  //   icon: Icons.rocket,
  // ),
];

const List<NavBarItemModel> _defaultBottomNavBarItems = [
  NavBarItemModel(
    type: NavBarItemType.settings,
    route: 'settings',
    icon: Icons.settings_outlined,
  ),
];

@injectable
class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit()
      : super(
          const NavBarState.initial(
            items: _defaultNavBarItems,
            bottomItems: _defaultBottomNavBarItems,
            selectedItem: NavBarItemType.code,
          ),
        ) {
    listenForRouteChanges();
  }

  void onItemSelected(NavBarItemModel item) {
    router.goNamed(item.route);
  }

  void listenForRouteChanges() {
    router.routerDelegate.addListener(() {
      final fullPath = router.routerDelegate.currentConfiguration.fullPath;
      final selectedItem = [...state.items, ...state.bottomItems].firstWhere(
        (item) => fullPath.contains(item.route),
        orElse: () => state.bottomItems.first,
      );
      emit(
        state.copyWith(
          selectedItem: selectedItem.type,
        ),
      );
    });
  }
}
