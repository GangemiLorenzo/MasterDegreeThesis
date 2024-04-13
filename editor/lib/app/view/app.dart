import 'package:editor/app/router/local_router.dart';
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart';
import 'package:editor/app/theme/theme.dart';
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
      title: 'Pixabay Browser',
      theme: LocalTheme.lightTheme,
      darkTheme: LocalTheme.darkTheme,
      themeMode: context.select<GlobalSettingCubit, ThemeMode>(
        (cubit) => cubit.state.themeMode,
      ),
      routerConfig: localRoutingConfig,
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
      ],
      child: Builder(
        builder: (context) => child,
      ),
    );
  }
}
