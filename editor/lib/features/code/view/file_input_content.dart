import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileInputContent extends StatelessWidget {
  final bool isLoading;
  final String? filePath;

  const FileInputContent({
    required this.isLoading,
    this.filePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding48,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: filePath == null
                    ? CrossAxisAlignment.stretch
                    : CrossAxisAlignment.center,
                mainAxisAlignment: filePath == null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  if (filePath == null)
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpace12,
                        Text(
                          'Please select a smart contract file to get started.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  if (filePath == null)
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CodeCubit>(context)
                                .openSmartContract();
                          },
                          child: const Text(
                            'Open Smart Contract',
                          ),
                        ),
                      ),
                    ),
                  if (filePath != null) ...[
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<CodeCubit>(context).openSmartContract();
                      },
                      child: const Text(
                        'Change Smart Contract',
                      ),
                    ),
                    verticalSpace16,
                    Text(filePath!.split('/').last),
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
      ),
    );
  }
}
