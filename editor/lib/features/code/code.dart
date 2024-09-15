import 'package:editor/features/code/view/code.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

RouteBase get codeRoute {
  return GoRoute(
    name: 'code',
    path: '/code',
    pageBuilder: (context, state) => MaterialPage(
      child: Builder(
        builder: (_) => const CodePageBuilder(),
      ),
    ),
  );
}
