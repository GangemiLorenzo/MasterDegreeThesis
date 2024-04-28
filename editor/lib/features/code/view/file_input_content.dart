import 'dart:io';

import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileInputContent extends StatelessWidget {
  final bool isLoading;
  final File? file;

  const FileInputContent({
    required this.isLoading,
    this.file,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (file == null)
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CodeCubit>(context).openSmartContract();
                    },
                    child: const Text(
                      'Open Smart Contract',
                    ),
                  ),
                if (file != null) ...[
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<CodeCubit>(context).openSmartContract();
                    },
                    child: const Text(
                      'Change Smart Contract',
                    ),
                  ),
                  verticalSpace16,
                  Text(file!.path.split('/').last),
                  verticalSpace16,
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CodeCubit>(context).submitFile();
                    },
                    child: const Text(
                      'Submit Smart Contract',
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
