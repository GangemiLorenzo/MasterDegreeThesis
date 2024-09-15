import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart';
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
            : ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 500,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (filePath == null)
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Step 1 out of 3',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          verticalSpace48,
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpace12,
                        ],
                      ),
                    if (filePath == null) ...[
                      const Spacer(),
                      const Text(
                        'Please select a smart contract file to get started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      verticalSpace16,
                      Row(
                        children: [
                          Expanded(
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
                        ],
                      ),
                    ],
                    if (filePath != null) ...[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Step 2 out of 3',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          verticalSpace48,
                          const Text(
                            'Smart Contract selected',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpace12,
                          Text(
                            filePath!.split('/').last,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      verticalSpace16,
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<SecureSettingsCubit,
                                SecureSettingsState>(
                              builder: (context, state) {
                                final openAiKey = state.openAIKey;

                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if (openAiKey.isEmpty) ...[
                                      const Center(
                                        child: Text(
                                          'Please, add an open ai key in the settings',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      verticalSpace4,
                                    ],
                                    ElevatedButton(
                                      onPressed: openAiKey.isNotEmpty
                                          ? () {
                                              BlocProvider.of<CodeCubit>(
                                                context,
                                              ).submitFile(
                                                openAiKey,
                                              );
                                            }
                                          : null,
                                      child: const Text(
                                        'Submit Smart Contract',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpace16,
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.orange,
                              ),
                              onPressed: () {
                                BlocProvider.of<CodeCubit>(context).reset();
                              },
                              child: const Text(
                                'Wrong one? Go back',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
      ),
    );
  }
}
