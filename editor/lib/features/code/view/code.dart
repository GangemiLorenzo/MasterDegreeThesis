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
              ),
            );
          },
        ),
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
