import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/view/file_input_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodePageBuilder extends StatelessWidget {
  const CodePageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding8,
      child: Card(
        child: BlocBuilder<CodeCubit, CodeState>(
          builder: (context, state) {
            return state.map(
              initial: (state) => FileInputContent(
                isLoading: state.isLoading,
                file: state.file,
              ),
              processing: (state) => ProcessingPage(
                taskId: state.taskId,
              ),
              loaded: (state) => const CodePage(),
            );
          },
        ),
      ),
    );
  }
}

class ProcessingPage extends StatelessWidget {
  final String taskId;

  const ProcessingPage({
    required this.taskId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(taskId),
          verticalSpace16,
          const SizedBox(
            width: 200,
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class CodePage extends StatelessWidget {
  const CodePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Content'),
    );
  }
}
