import 'package:editor/features/navbar/cubit/navbar_cubit.dart';
import 'package:editor/features/navbar/view/widget/navbar_content.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<NavBarCubit>(),
      child: Builder(
        builder: (_) => const _NavBar(),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 80,
        ),
        child: const NavBarContent(),
      ),
    );
  }
}
