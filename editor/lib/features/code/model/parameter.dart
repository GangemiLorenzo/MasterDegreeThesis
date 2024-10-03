import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter.freezed.dart';
part 'parameter.g.dart';

@freezed
class Parameter with _$Parameter implements VisualElement {
  const Parameter._();

  const factory Parameter({
    required String id,
    required String name,
    required String type,
    required String storage,
    @Default(false) bool isIndexed,
    @Default(false) bool isPayable,
  }) = _Parameter;

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);

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

    final card = ParameterGridCard(
      id: id,
      position: position,
    );

    return VisualRapresentation(
      nextPosition: position != null
          ? MyPoint(
              position.x,
              position.y - 220,
            )
          : null,
      cards: [
        card,
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
      ParameterDetailsForm(data: this);

  @override
  List<TextSpan> get toDescription => [];
}

/// Returns a widget that represents a [Struct] element in a grid card.
class ParameterGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const ParameterGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data =
            BlocProvider.of<CodeCubit>(context).getItem(id) as Parameter;
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
              title: 'Type',
              value: data.type,
            ),
            GridCardItem.value(
              id: 2,
              title: 'Storage',
              value: data.storage,
            ),
            GridCardItem.value(
              id: 3,
              title: 'Indexed',
              value: data.isIndexed ? 'Yes' : 'No',
            ),
            GridCardItem.value(
              id: 4,
              title: 'Payable',
              value: data.isPayable ? 'Yes' : 'No',
            ),
          ],
          title: 'Parameter',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class ParameterDetailsForm extends StatelessWidget {
  final Parameter data;

  const ParameterDetailsForm({
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
          initialValue: data.type,
          decoration: const InputDecoration(
            labelText: 'Type',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(type: value),
            );
          },
        ),
        TextFormField(
          initialValue: data.storage,
          decoration: const InputDecoration(
            labelText: 'Storage',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(storage: value),
            );
          },
        ),
        Row(
          children: [
            Checkbox(
              value: data.isIndexed,
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(isIndexed: value ?? false),
                );
              },
            ),
            const Text('Indexed'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: data.isPayable,
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(isPayable: value ?? false),
                );
              },
            ),
            const Text('Payable'),
          ],
        ),
      ],
    );
  }
}
