import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/view/code.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

RouteBase get codeRoute {
  return GoRoute(
    name: 'code',
    path: '/code',
    pageBuilder: (context, state) => MaterialPage(
      child: BlocProvider(
        create: (context) => getIt.get<CodeCubit>(),
        child: Builder(
          builder: (_) => const CodePageBuilder(),
        ),
      ),
    ),
  );
}
