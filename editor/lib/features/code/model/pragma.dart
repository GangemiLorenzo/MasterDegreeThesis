import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pragma.freezed.dart';
part 'pragma.g.dart';

@freezed
class Pragma with _$Pragma implements VisualElement {
  const Pragma._();

  const factory Pragma({
    required String id,
    required String name,
    required String value,
  }) = _Pragma;

  factory Pragma.fromJson(Map<String, dynamic> json) => _$PragmaFromJson(json);

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
        PragmaGridCard(
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
  Widget toDetailsForm() => PragmaDetailsForm(data: this);
}

/// Returns a widget that represents a [Pragma] element in a grid card.
class PragmaGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const PragmaGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data = BlocProvider.of<CodeCubit>(context).getItem(id) as Pragma;
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
              title: 'Value',
              value: data.value,
            ),
          ],
          title: 'Pragma',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class PragmaDetailsForm extends StatelessWidget {
  final Pragma data;

  const PragmaDetailsForm({
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
      ],
    );
  }
}
