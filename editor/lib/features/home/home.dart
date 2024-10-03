import 'package:editor/features/code/code.dart';
import 'package:editor/features/contract/contract.dart';
import 'package:editor/features/home/cubit/home_cubit.dart';
import 'package:editor/features/home/view/home.dart';
import 'package:editor/features/settings/settigs.dart';
import 'package:editor/foundation/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

export 'view/home.dart';

RouteBase get homeRoute {
  return ShellRoute(
    builder: (context, state, child) => BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: Builder(
        builder: (_) => HomePageBuilder(
          child: child,
        ),
      ),
    ),
    routes: [
      codeRoute,
      settingsRoute,
      contractRoute,
      GoRoute(
        name: 'deploy',
        path: '/deploy',
        builder: (context, state) => const Center(
          child: Text('deploy'),
        ),
      ),
    ],
  );
}
