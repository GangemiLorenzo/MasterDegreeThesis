import 'package:editor/features/settings/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

RouteBase get settingsRoute {
  return GoRoute(
    name: 'settings',
    path: '/settings',
    pageBuilder: (context, state) => MaterialPage(
      fullscreenDialog: true,
      key: state.pageKey,
      child: const SettingsPageBuilder(),
    ),
  );
}
