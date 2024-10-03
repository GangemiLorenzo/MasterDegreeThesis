import 'dart:convert';
import 'dart:typed_data';

import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/source_unit.dart';
import 'package:editor/utils/highlight_code_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class ContractPageBuilder extends StatelessWidget {
  const ContractPageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding8,
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: BlocBuilder<CodeCubit, CodeState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (state) => ContractCodePage(
                      fileBytes: state.fileBytes,
                    ),
                    orElse: () => Container(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: BlocListener<CodeCubit, CodeState>(
                listenWhen: (previous, current) {
                  final currentSaved = current.mapOrNull(
                        loaded: (state) => state.justSavedFile,
                      ) ??
                      false;

                  final previousSaved = previous.mapOrNull(
                        loaded: (state) => state.justSavedFile,
                      ) ??
                      false;

                  return currentSaved != previousSaved && currentSaved;
                },
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('File saved successfully in the Dowload folder'),
                    ),
                  );
                },
                child: BlocBuilder<CodeCubit, CodeState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      loaded: (state) => ContractDescriptionPage(
                        sourceUnit: state.task.sourceUnit,
                      ),
                      orElse: () => Container(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContractCodePage extends StatelessWidget {
  final Uint8List fileBytes;

  const ContractCodePage({
    required this.fileBytes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: HighlightView(
                utf8.decode(fileBytes),
                language: 'solidity',
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                ),
                theme: getHighlightTheme(context),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContractDescriptionPage extends StatelessWidget {
  final SourceUnit sourceUnit;

  const ContractDescriptionPage({
    required this.sourceUnit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SelectionArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text.rich(
                            TextSpan(
                              children: sourceUnit.toDescription,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: const Icon(Icons.font_download),
            onPressed: () {
              context.read<CodeCubit>().downloadDescription();
            },
          ),
        ),
      ],
    );
  }
}
