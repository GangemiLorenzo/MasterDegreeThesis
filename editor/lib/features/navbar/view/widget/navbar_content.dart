import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/navbar/cubit/navbar_cubit.dart';
import 'package:editor/features/navbar/model/navbar_item_model.dart';
import 'package:editor/features/navbar/view/widget/navbar_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarContent extends StatelessWidget {
  const NavBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Padding(
          padding: allPadding4,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...state.items.map(
                  (item) => buildItem(
                    item: item,
                    state: state,
                    context: context,
                  ),
                ),
                const Spacer(),
                ...state.bottomItems.map(
                  (item) => buildItem(
                    item: item,
                    state: state,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  NavBarItemButton buildItem({
    required NavBarItemModel item,
    required NavBarState state,
    required BuildContext context,
  }) =>
      NavBarItemButton(
        item: item,
        isSelected: state.selectedItem == item.type,
        onPressed: () => context.read<NavBarCubit>().onItemSelected(item),
      );
}
