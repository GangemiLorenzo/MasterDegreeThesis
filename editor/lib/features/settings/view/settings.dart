import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/settings/view/widget/open_ai_key_settings_item.dart';
import 'package:editor/features/settings/view/widget/theme_settings_item.dart';
import 'package:flutter/material.dart';

class SettingsPageBuilder extends StatelessWidget {
  const SettingsPageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SettingsPage();
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding8,
      child: Card(
        child: Padding(
          padding: allPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              verticalSpace4,
              const Divider(),
              verticalSpace8,
              const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeSettingsItem(),
                    verticalSpace16,
                    OpenAIKeySettingsItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
