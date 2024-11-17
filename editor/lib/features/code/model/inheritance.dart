import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inheritance.freezed.dart';
part 'inheritance.g.dart';

@freezed
class Inheritance with _$Inheritance implements VisualElement {
  const Inheritance._();

  const factory Inheritance({
    required String id,
    required String name,
    @Default([]) List<String> values,
  }) = _Inheritance;

  factory Inheritance.fromJson(Map<String, dynamic> json) =>
      _$InheritanceFromJson(json);

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
        InheritanceCard(
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
  Widget toDetailsForm() => InheritanceDetailsForm(
        data: this,
      );

  @override
  List<TextSpan> get toDescription => [];
}

class InheritanceCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const InheritanceCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data =
            BlocProvider.of<CodeCubit>(context).getItem(id) as Inheritance;
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
            if (data.values.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Values',
              ),
              ...data.values.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e,
                  value: '',
                ),
              ),
            ],
          ],
          title: 'Inheritance',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class InheritanceDetailsForm extends StatelessWidget {
  final Inheritance data;

  const InheritanceDetailsForm({
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
        if (data.values.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('Values:'),
          ...data.values.map(
            (e) => TextFormField(
              initialValue: e,
              decoration: const InputDecoration(
                labelText: 'Value',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    values: [
                      for (final p in data.values)
                        if (p == e) value else p,
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
