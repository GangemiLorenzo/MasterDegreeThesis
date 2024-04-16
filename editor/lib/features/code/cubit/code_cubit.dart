import 'package:editor/features/home/repo/home_repo.dart';
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

  final HomeRepo repo;
}
