import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol.freezed.dart';
part 'symbol.g.dart';

@freezed
class Symbol with _$Symbol implements VisualElement {
  const Symbol._();

  const factory Symbol({
    required String id,
    required String name,
    required String alias,
  }) = _Symbol;

  factory Symbol.fromJson(Map<String, dynamic> json) => _$SymbolFromJson(json);

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
      operation: linkDescription ?? 'Defines',
      color: linkColor,
    );

    return VisualRapresentation(
      nextPosition: position != null
          ? MyPoint(
              position.x,
              position.y - 220,
            )
          : null,
      cards: [
        SymbolGridCard(
          id: id,
          position: position,
        ),
      ],
      links: [
        linkPair,
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

    return null;
  }

  @override
  Widget toDetailsForm({
    List<LinkPair> links = const [],
  }) =>
      SymbolDetailsForm(data: this);

  @override
  List<TextSpan> get toDescription => [];
}

/// Returns a widget that represents a [Symbol] element in a grid card.
class SymbolGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const SymbolGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data = BlocProvider.of<CodeCubit>(context).getItem(id) as Symbol;
        return GridCard(
          key: Key(data.id),
          isSelected: BlocProvider.of<CodeCubit>(context).isSelected(data.id),
          position: position ?? const MyPoint(0, 0),
          properties: [
            GridCardItem.value(
              id: 0,
              title: 'Name',
              value: data.name,
            ),
            GridCardItem.value(
              id: 1,
              title: 'Alias',
              value: data.alias,
            ),
          ],
          title: 'Symbol',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class SymbolDetailsForm extends StatelessWidget {
  final Symbol data;

  const SymbolDetailsForm({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: data.name,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(name: value),
            );
          },
        ),
        TextFormField(
          initialValue: data.alias,
          decoration: const InputDecoration(
            labelText: 'Alias',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(alias: value),
            );
          },
        ),
      ],
    );
  }
}
