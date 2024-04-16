import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/navbar/model/navbar_item_model.dart';
import 'package:flutter/material.dart';

class NavBarItemButton extends StatelessWidget {
  final EdgeInsets padding;
  final NavBarItemModel item;
  final VoidCallback? onPressed;
  final bool isSelected;

  const NavBarItemButton({
    required this.item,
    this.padding = allPadding8,
    this.onPressed,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton.outlined(
        isSelected: isSelected,
        onPressed: onPressed,
        icon: Padding(
          padding: allPadding4,
          child: Column(
            children: [
              Icon(
                item.icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
