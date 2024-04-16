import 'dart:io';

import 'package:editor/features/code/repo/code_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'code_cubit.freezed.dart';
part 'code_state.dart';

@injectable
class CodeCubit extends Cubit<CodeState> {
  CodeCubit({
    required this.repo,
  }) : super(
          const CodeState.initial(),
        );

  final CodeRepo repo;

  void openSmartContract() async {
    if (state is! _Initial) {
      return;
    }
    final currentState = state as _Initial;

    emit(
      currentState.copyWith(
        isLoading: true,
      ),
    );

    final file = await repo.openSmartContract();
    if (file == null) {
      emit(
        currentState.copyWith(
          isLoading: false,
        ),
      );
      return;
    }

    emit(
      currentState.copyWith(
        isLoading: false,
        file: file,
      ),
    );
  }
}
