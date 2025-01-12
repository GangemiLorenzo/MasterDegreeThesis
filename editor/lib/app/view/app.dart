import 'package:editor/app/router/local_router.dart';
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart';
import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart';
import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BaseCubitProvider(
      child: PixabayBrowserMaterialApp(),
    );
  }
}

class PixabayBrowserMaterialApp extends StatelessWidget {
  const PixabayBrowserMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Editor',
      theme: LocalTheme.lightTheme,
      darkTheme: LocalTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: context.select<GlobalSettingCubit, ThemeMode>(
        (cubit) => cubit.state.themeMode,
      ),
      routerConfig: router,
    );
  }
}

/// Wraps the app to inject cubits at the lowest level possible
class BaseCubitProvider extends StatelessWidget {
  const BaseCubitProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalSettingCubit>(
          create: (_) => getIt.get<GlobalSettingCubit>(),
        ),
        BlocProvider<SecureSettingsCubit>(
          create: (_) => getIt.get<SecureSettingsCubit>(),
        ),
        BlocProvider<CodeCubit>(
          create: (_) => getIt.get<CodeCubit>(),
        ),
      ],
      child: Builder(
        builder: (_) => child,
      ),
    );
  }
}
