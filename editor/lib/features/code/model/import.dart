import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/symbol.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'import.freezed.dart';
part 'import.g.dart';

@freezed
class Import with _$Import implements VisualElement {
  const Import._();

  const factory Import({
    required String id,
    required String path,
    @Default([]) List<Symbol> symbols,
  }) = _Import;

  factory Import.fromJson(Map<String, dynamic> json) => _$ImportFromJson(json);

  String get name => path.split('/').last.replaceAll('"', '');

  @override
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    required String fatherId,
    MyPoint? position,
    String? linkDescription,
    Color? linkColor,
  }) {
    final linkPair = LinkPair(
      startId: fatherId,
      endId: id,
      operation: linkDescription ?? 'Imports',
      color: linkColor,
    );
    final vrSymbols = symbols
        .map(
          (s) => s.toVisualRapresentation(
            context: context,
            fatherId: id,
          ),
        )
        .reduceVR();

    return VisualRapresentation(
      nextPosition: position != null
          ? MyPoint(
              position.x,
              position.y - 220,
            )
          : null,
      cards: [
        ImportCard(
          id: id,
          position: position,
        ),
        ...vrSymbols.cards,
      ],
      links: [
        linkPair,
        ...vrSymbols.links,
      ],
    );
  }

  @override
  VisualElement? findById({
    required String id,
  }) {
    if (id == this.id) {
      return copyWith();
    }

    for (final s in symbols) {
      final result = s.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  @override
  VisualElement? replaceById({
    required String id,
    required VisualElement element,
  }) {
    if (id == this.id) {
      return element;
    }

    for (var i = 0; i < symbols.length; i++) {
      final result = symbols[i].replaceById(id: id, element: element);
      if (result != null) {
        final newSymbols = List<Symbol>.from(symbols);
        newSymbols[i] = result as Symbol;
        return copyWith(symbols: newSymbols);
      }
    }

    return null;
  }

  @override
  Widget toDetailsForm({
    List<LinkPair> links = const [],
  }) =>
      ImportDetailsForm(
        data: this,
      );

  @override
  List<TextSpan> get toDescription => [];
}

class ImportCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const ImportCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data = BlocProvider.of<CodeCubit>(context).getItem(id) as Import;
        return GridCard(
          key: Key(data.id),
          isSelected: BlocProvider.of<CodeCubit>(context).isSelected(data.id),
          position: position ?? const MyPoint(0, 0),
          properties: [
            GridCardItem.value(
              id: 0,
              title: 'File:',
              value: data.name,
            ),
            if (data.symbols.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Symbols',
              ),
              ...data.symbols.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e.name,
                  value: e.alias,
                ),
              ),
            ],
          ],
          title: 'Import',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class ImportDetailsForm extends StatelessWidget {
  final Import data;

  const ImportDetailsForm({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: data.path,
          decoration: const InputDecoration(
            labelText: 'Path',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(path: value),
            );
          },
        ),
        if (data.symbols.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('Symbols:'),
          ...data.symbols.map(
            (e) => TextFormField(
              initialValue: e.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    symbols: [
                      for (final s in data.symbols)
                        if (s == e) s.copyWith(name: value) else s,
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
