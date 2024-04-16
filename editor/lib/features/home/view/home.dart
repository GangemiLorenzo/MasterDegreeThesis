import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/home/cubit/home_cubit.dart';
import 'package:editor/features/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBuilder extends StatelessWidget {
  final Widget child;

  const HomePageBuilder({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => HomePage(
            child: child,
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Padding(
            padding: allPadding8,
            child: NavBar(),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
