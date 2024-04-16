import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileInputContent extends StatelessWidget {
  final bool isLoading;

  const FileInputContent({
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CodeCubit>(context).openSmartContract();
                  },
                  child: const Text('Open Smart Contract'),
                ),
        ],
      ),
    );
  }
}
