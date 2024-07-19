import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variable.freezed.dart';
part 'variable.g.dart';

@freezed
class Variable with _$Variable implements VisualElement {
  const Variable._();

  const factory Variable({
    required String id,
    required String name,
    required String type,
    required String visibility,
    required String mappingFrom,
    required String mappingTo,
    required String value,
    @Default([]) List<String> modifiers,
  }) = _Variable;

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  @override
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    MyPoint? position,
  }) {
    return VisualRapresentation(
      nextPosition: position != null
          ? MyPoint(
              position.x,
              position.y - 220,
            )
          : null,
      cards: [
        VariableGridCard(
          id: id,
          position: position,
        ),
      ],
      links: [],
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
  Widget toDetailsForm() => VariableDetailsForm(
        data: this,
      );
}

/// Returns a widget that represents a [Variable] element in a grid card.
class VariableGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const VariableGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data =
            BlocProvider.of<CodeCubit>(context).getItem(id) as Variable;
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
            if (data.value.isNotEmpty) ...[
              GridCardItem.value(
                id: 1,
                title: 'Value',
                value: data.value,
              ),
            ],
            GridCardItem.value(
              id: 2,
              title: 'Type',
              value: data.type,
            ),
            GridCardItem.value(
              id: 2,
              title: 'Visibility',
              value: data.visibility,
            ),
            if (data.modifiers.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Modifiers',
              ),
              ...data.modifiers.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e,
                  value: '',
                ),
              ),
            ],
          ],
          title: 'Variable',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class VariableDetailsForm extends StatelessWidget {
  final Variable data;

  const VariableDetailsForm({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          key: Key('1${data.id}'),
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
          key: Key('2${data.id}'),
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
          key: Key('3${data.id}'),
          initialValue: data.visibility,
          decoration: const InputDecoration(
            labelText: 'Visibility',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(visibility: value),
            );
          },
        ),
        TextFormField(
          key: Key('4${data.id}'),
          initialValue: data.value,
          decoration: const InputDecoration(
            labelText: 'Value',
          ),
          onChanged: (value) {
            BlocProvider.of<CodeCubit>(context).updateItem(
              data.copyWith(value: value),
            );
          },
        ),
        if (data.modifiers.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('Modifiers:'),
          ...data.modifiers.map(
            (e) => TextFormField(
              initialValue: e,
              decoration: const InputDecoration(
                labelText: 'Modifier',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    modifiers: [
                      ...data.modifiers.where((element) => element != e),
                      value,
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
