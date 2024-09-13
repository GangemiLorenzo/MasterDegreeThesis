import 'package:editor/app/theme/theme.dart';
import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/contract.dart';
import 'package:editor/features/code/model/source_unit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor/features/code/model/vulnerability.dart';
import 'package:editor/features/code/view/file_input_content.dart';
import 'package:editor_grid/editor_grid.dart';
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
      child: Row(
        children: [
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
                child: BlocConsumer<CodeCubit, CodeState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      processing: (_, __, ___, progress, ____) {
                        if (progress == 0) {
                          context.read<CodeCubit>().startPollingTask();
                        }
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.map(
                      initial: (state) => FileInputContent(
                        isLoading: state.isLoading,
                        filePath: state.fileName,
                      ),
                      processing: (state) => ProcessingPage(
                        taskId: state.taskId,
                        progress: state.progress,
                        message: state.message,
                      ),
                      loaded: (state) => CodePage(
                        sourceUnit: state.task.sourceUnit,
                        vulnerabilities: state.task.vulnerabilities,
                        functionalLinks: state.task.links
                            .map((e) => e.toLinkPair())
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Card(
            child: ElementDetails(),
          ),
        ],
      ),
    );
  }
}

class ProcessingPage extends StatelessWidget {
  final String taskId;
  final int progress;
  final String message;

  const ProcessingPage({
    required this.taskId,
    required this.progress,
    required this.message,
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
          Text(message),
          verticalSpace16,
          SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: progress != 0 ? progress / 100 : null,
            ),
          ),
        ],
      ),
    );
  }
}

class CodePage extends StatefulWidget {
  final SourceUnit sourceUnit;
  final List<Vulnerability> vulnerabilities;
  final List<LinkPair> functionalLinks;

  const CodePage({
    required this.sourceUnit,
    required this.vulnerabilities,
    required this.functionalLinks,
    super.key,
  });

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: widget.sourceUnit.contracts.length +
          1 +
          (widget.vulnerabilities.isNotEmpty ? 1 : 0),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              controller: controller,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                if (widget.vulnerabilities.isNotEmpty)
                  const Tab(text: 'Vulnerabilities'),
                const Tab(text: 'Meta'),
                for (var contract in widget.sourceUnit.contracts)
                  Tab(text: contract.name),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  if (widget.vulnerabilities.isNotEmpty)
                    VulnerabilitiesEditor(
                      vulnerabilities: widget.vulnerabilities,
                    ),
                  MetaEditor(
                    sourceUnit: widget.sourceUnit,
                  ),
                  for (var contract in widget.sourceUnit.contracts)
                    ContractEditor(
                      contract: contract,
                      functionalLinks: widget.functionalLinks,
                    ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Row(
            children: [
              // FloatingActionButton(
              //   backgroundColor: Theme.of(context).colorScheme.primary,
              //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
              //   child: const Icon(Icons.refresh),
              //   onPressed: () {
              //     context.read<CodeCubit>().uploadSourceUnit();
              //   },
              // ),
              const SizedBox(width: 16),
              FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                child: const Icon(Icons.download),
                onPressed: () {
                  context.read<CodeCubit>().downloadCode();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VulnerabilitiesEditor extends StatelessWidget {
  final List<Vulnerability> vulnerabilities;

  const VulnerabilitiesEditor({
    required this.vulnerabilities,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vulnerabilities Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Total Vulnerabilities: ${vulnerabilities.length}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...Vulnerability.severities.map((severity) {
            final count = vulnerabilities
                .where((v) => v.severity.toLowerCase() == severity)
                .length;
            return Text(
              '$severity: $count',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Vulnerability.getSeverityColor(severity),
              ),
            );
          }),
          const SizedBox(height: 16),
          const Text(
            'Vulnerabilities List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: vulnerabilities.length,
              itemBuilder: (context, index) {
                final vulnerability = vulnerabilities[index];
                final borderColor = vulnerability.severityColor;

                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      vulnerability.check,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(vulnerability.description),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MetaEditor extends StatefulWidget {
  final SourceUnit sourceUnit;

  const MetaEditor({
    required this.sourceUnit,
    super.key,
  });

  @override
  State<MetaEditor> createState() => _MetaEditorState();
}

class _MetaEditorState extends State<MetaEditor>
    with AutomaticKeepAliveClientMixin {
  late VisualRapresentation visualRapresentation;

  @override
  void initState() {
    const startingPosition = MyPoint(-500, 500);
    visualRapresentation = widget.sourceUnit.toVisualRapresentation(
      context: context,
      fatherId: '',
      position: startingPosition,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned.fill(
          child: EditorGrid(
            links: visualRapresentation.links,
            children: visualRapresentation.cards,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ContractEditor extends StatefulWidget {
  final Contract contract;
  final List<LinkPair> functionalLinks;

  const ContractEditor({
    required this.contract,
    required this.functionalLinks,
    super.key,
  });

  @override
  State<ContractEditor> createState() => _ContractEditorState();
}

class _ContractEditorState extends State<ContractEditor>
    with AutomaticKeepAliveClientMixin {
  late VisualRapresentation visualRapresentation;

  @override
  void initState() {
    const startingPosition = MyPoint(-500, 500);
    visualRapresentation = widget.contract.toVisualRapresentation(
      context: context,
      fatherId: '',
      position: startingPosition,
    );
    visualRapresentation.links.addAll(widget.functionalLinks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned.fill(
          child: EditorGrid(
            links: visualRapresentation.links,
            children: visualRapresentation.cards,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ElementDetails extends StatelessWidget {
  const ElementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionProvider = ConnectionProvider.of(context);
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          processing: (_) => Container(),
          loaded: (state) {
            if (state.selectedItem == null) {
              return const SizedBox(
                width: 300,
              );
            }
            final selectedElement =
                state.task.sourceUnit.findById(id: state.selectedItem!);
            if (selectedElement != null) {
              return SizedBox(
                width: 300,
                child: Padding(
                  padding: allPadding16,
                  child: selectedElement.toDetailsForm(
                    links: connectionProvider
                            ?.getConnectionsFromId(selectedElement.id) ??
                        [],
                  ),
                ),
              );
            }

            return Container();
          },
        );
      },
    );
  }
}
