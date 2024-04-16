import 'package:editor/app/state/global_settings/global_setting.dart';
import 'package:editor/app/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSettingsItem extends StatelessWidget {
  const ThemeSettingsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSettingCubit, GlobalSettingState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  verticalSpace4,
                  Text(
                    'The theme setting allows to switch between light, dark and system theme.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
            horizontalSpace8,
            DropdownMenu<ThemeMode>(
              initialSelection: state.themeMode,
              onSelected: (value) {
                if (value == null) {
                  return;
                }
                context.read<GlobalSettingCubit>().setTheme(value);
              },
              dropdownMenuEntries: ThemeMode.values
                  .map<DropdownMenuEntry<ThemeMode>>((ThemeMode mode) {
                return DropdownMenuEntry<ThemeMode>(
                  value: mode,
                  label: mode.toString().split('.').last,
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
