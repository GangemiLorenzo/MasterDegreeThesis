import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/parameter.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modifier.freezed.dart';
part 'modifier.g.dart';

@freezed
class Modifier with _$Modifier implements VisualElement {
  const Modifier._();

  const factory Modifier({
    required String id,
    required String name,
    required String body,
    @Default([]) List<Parameter> parameters,
  }) = _Modifier;

  factory Modifier.fromJson(Map<String, dynamic> json) =>
      _$ModifierFromJson(json);

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

    final lastPosition = position ?? const MyPoint(0, 0);

    var variablePosition = MyPoint(lastPosition.x + 300, lastPosition.y);
    final vrParameters = parameters.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: variablePosition,
      );
      variablePosition = vr.nextPosition ?? lastPosition;
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
        ModifierErrorCard(
          id: id,
          position: position,
        ),
        ...vrParameters.cards,
      ],
      links: [
        linkPair,
        ...vrParameters.links,
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

    for (final p in parameters) {
      final result = p.findById(id: id);
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

    for (var i = 0; i < parameters.length; i++) {
      final result = parameters[i].replaceById(id: id, element: element);
      if (result != null) {
        final newParameters = List<Parameter>.from(parameters);
        newParameters[i] = result as Parameter;
        return copyWith(parameters: newParameters);
      }
    }

    return null;
  }

  @override
  Widget toDetailsForm({
    List<LinkPair> links = const [],
  }) =>
      ModifierErrorDetailsForm(data: this);

  @override
  List<TextSpan> get toDescription => [];
}

class ModifierErrorCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const ModifierErrorCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data =
            BlocProvider.of<CodeCubit>(context).getItem(id) as Modifier;
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
            if (data.parameters.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Parameters',
              ),
              ...data.parameters.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e.name,
                  value: e.type,
                ),
              ),
            ],
          ],
          title: 'Modifier',
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class ModifierErrorDetailsForm extends StatelessWidget {
  final Modifier data;

  const ModifierErrorDetailsForm({
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
        if (data.parameters.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('Parameters:'),
          ...data.parameters.map(
            (e) => TextFormField(
              initialValue: e.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    parameters: [
                      for (final p in data.parameters)
                        if (p == e) p.copyWith(name: value) else p,
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
