import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/variable.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'struct.freezed.dart';
part 'struct.g.dart';

@freezed
class Struct with _$Struct implements VisualElement {
  const Struct._();

  const factory Struct({
    required String id,
    required String name,
    @Default([]) List<Variable> fields,
  }) = _Struct;

  factory Struct.fromJson(Map<String, dynamic> json) => _$StructFromJson(json);

  @override
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    MyPoint? position,
  }) {
    final lastPosition = position ?? const MyPoint(0, 0);
    var fieldPosition = MyPoint(lastPosition.x + 300, lastPosition.y);
    final vrFields = fields.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: fieldPosition,
      );
      fieldPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    return VisualRapresentation(
      nextPosition: position != null
          ? MyPoint(
              position.x,
              position.y - 220,
            )
          : null,
      cards: [
        StructGridCard(
          id: id,
          position: position,
        ),
        ...vrFields.cards,
      ],
      links: [
        ...vrFields.links,
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

    for (final f in fields) {
      final result = f.findById(id: id);
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

    for (var i = 0; i < fields.length; i++) {
      final result = fields[i].replaceById(id: id, element: element);
      if (result != null) {
        final newFields = List<Variable>.from(fields);
        newFields[i] = result as Variable;
        return copyWith(fields: newFields);
      }
    }

    return null;
  }

  @override
  Widget toDetailsForm() => StructDetailsForm(data: this);
}

/// Returns a widget that represents a [Struct] element in a grid card.
class StructGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const StructGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data = BlocProvider.of<CodeCubit>(context).getItem(id) as Struct;
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
            if (data.fields.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Fields',
              ),
              ...data.fields.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e.name,
                  value: e.type,
                ),
              ),
            ],
          ],
          title: 'Struct',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class StructDetailsForm extends StatelessWidget {
  final Struct data;

  const StructDetailsForm({
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
        if (data.fields.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('Fields:'),
          ...data.fields.map(
            (e) => TextFormField(
              initialValue: e.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    fields: [
                      for (final f in data.fields)
                        if (f == e) f.copyWith(name: value) else f,
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
