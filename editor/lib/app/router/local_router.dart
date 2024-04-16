import 'package:editor/features/home/home.dart';
import 'package:go_router/go_router.dart';

/// Listen for auth state changes and return the appropriate routing config
// final localRoutingConfig = (BuildContext context) =>
//     context.watch<AuthCubit>().isLoggedIn
//         ? authenticatedRoutingConfig
//         : notLoggedRoutingConfig;

final router = GoRouter(
  initialLocation: '/code',
  routes: [
    homeRoute,
  ],
);
