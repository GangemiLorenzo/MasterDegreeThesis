import 'package:editor/features/contract/view/contract.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

RouteBase get contractRoute {
  return GoRoute(
    name: 'contract',
    path: '/contract',
    pageBuilder: (context, state) => MaterialPage(
      child: Builder(
        builder: (_) => const ContractPageBuilder(),
      ),
    ),
  );
}
