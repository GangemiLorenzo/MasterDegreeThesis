import 'package:editor/features/home/cubit/home_cubit.dart';
import 'package:editor/features/home/view/home.dart';
import 'package:editor/foundation/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

export 'view/home.dart';

RouteBase get homeRoute {
  return ShellRoute(
    builder: (context, state, child) => BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: child,
    ),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePageBuilder(),
      ),
    ],
  );
}
