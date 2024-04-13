import 'package:editor/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

/// Home cubit for displaying and interacting with folders
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.repo,
  }) : super(
          const HomeState.initial(),
        );

  final HomeRepo repo;
}
