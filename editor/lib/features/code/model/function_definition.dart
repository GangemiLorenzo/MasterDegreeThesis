import 'package:editor/features/code/cubit/code_cubit.dart';
import 'package:editor/features/code/model/parameter.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'function_definition.freezed.dart';
part 'function_definition.g.dart';

@freezed
class FunctionDefinition with _$FunctionDefinition implements VisualElement {
  const FunctionDefinition._();

  const factory FunctionDefinition({
    required String id,
    required String name,
    required String visibility,
    required String body,
    required String stateMutability,
    required String description,
    @Default(false) bool isConstructor,
    @Default(false) bool isFallback,
    @Default(false) bool isReceive,
    @Default([]) List<Parameter> parameters,
    @Default([]) List<Parameter> returns,
    @Default([]) List<String> modifiers,
  }) = _FunctionDefinition;

  factory FunctionDefinition.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefinitionFromJson(json);

  @override
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    MyPoint? position,
  }) {
    final lastPosition = position ?? const MyPoint(0, 0);

    final gridCard = FunctionGridCard(id: id, position: lastPosition);

    var variablePosition = MyPoint(lastPosition.x + 300, lastPosition.y);
    final vrVariables = parameters.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: variablePosition,
      );
      variablePosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    var returnPosition = variablePosition;
    final vrReturns = returns.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: returnPosition,
      );
      returnPosition = vr.nextPosition ?? lastPosition;
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
        gridCard,
        ...vrVariables.cards,
        ...vrReturns.cards,
      ],
      links: [
        ...vrVariables.links,
        ...vrReturns.links,
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

    for (final r in returns) {
      final result = r.findById(id: id);
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

    for (var i = 0; i < returns.length; i++) {
      final result = returns[i].replaceById(id: id, element: element);
      if (result != null) {
        final newReturns = List<Parameter>.from(returns);
        newReturns[i] = result as Parameter;
        return copyWith(returns: newReturns);
      }
    }

    return null;
  }

  @override
  Widget toDetailsForm() => FunctionDetailsForm(data: this);
}

class FunctionGridCard extends StatelessWidget {
  final String id;
  final MyPoint? position;

  const FunctionGridCard({
    required this.id,
    this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCubit, CodeState>(
      builder: (context, state) {
        final data = BlocProvider.of<CodeCubit>(context).getItem(id)
            as FunctionDefinition;

        final title = data.isConstructor
            ? 'Constructor F.'
            : data.isFallback
                ? 'Fallback F.'
                : data.isReceive
                    ? 'Receive F.'
                    : 'Function';

        return GridCard(
          key: Key(data.id),
          isSelected: BlocProvider.of<CodeCubit>(context).isSelected(data.id),
          position: position ?? const MyPoint(0, 0),
          title: title,
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
            if (data.returns.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Returns',
              ),
              ...data.returns.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e.name,
                  value: e.type,
                ),
              ),
            ],
            if (data.modifiers.isNotEmpty) ...[
              GridCardItem.property(
                id: 1,
                title: 'Modifiers',
              ),
              ...data.modifiers.map(
                (e) => GridCardItem.value(
                  id: 2,
                  title: e,
                  value: ' ',
                ),
              ),
            ],
            GridCardItem.value(
              id: 3,
              title: 'Visibility:',
              value: data.visibility,
            ),
          ],
          onTap: () {
            BlocProvider.of<CodeCubit>(context).selectItem(data.id);
          },
        );
      },
    );
  }
}

class FunctionDetailsForm extends StatelessWidget {
  final FunctionDefinition data;

  const FunctionDetailsForm({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = data.isConstructor
        ? 'Constructor F.'
        : data.isFallback
            ? 'Fallback F.'
            : data.isReceive
                ? 'Receive F.'
                : 'Function';
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.95,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              key: Key('1${data.id}'),
              '$title:',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (!data.isConstructor && !data.isFallback && !data.isReceive)
              TextFormField(
                key: Key('2${data.id}'),
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
            const SizedBox(
              height: 16,
            ),
            Text(
              key: Key('3${data.id}'),
              'Description:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              key: Key('4${data.id}'),
              data.description,
              maxLines: 20,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              key: Key('5${data.id}'),
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
            if (data.parameters.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Parameters:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ...data.parameters.map(
                (e) => Row(
                  children: [
                    Expanded(
                      child: TextFormField(
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
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<CodeCubit>(context).updateItem(
                          data.copyWith(
                            parameters:
                                data.parameters.where((p) => p != e).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(
                    parameters: [
                      ...data.parameters,
                      Parameter(
                        id: const Uuid().v4(),
                        name: '',
                        type: '',
                        storage: '',
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Add Parameter'),
            ),
            if (data.returns.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Returns:'),
              ...data.returns.map(
                (e) => TextFormField(
                  key: Key('8${data.id}'),
                  initialValue: e.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    BlocProvider.of<CodeCubit>(context).updateItem(
                      data.copyWith(
                        returns: [
                          for (final p in data.returns)
                            if (p == e) p.copyWith(name: value) else p,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
            if (data.modifiers.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Modifiers:'),
              ...data.modifiers.map(
                (e) => TextFormField(
                  key: Key('9${data.id}'),
                  initialValue: e,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    BlocProvider.of<CodeCubit>(context).updateItem(
                      data.copyWith(
                        modifiers: [
                          for (final p in data.modifiers)
                            if (p == e) value else p,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              'Body:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            ConstrainedBox(
              key: Key('10${data.id}'),
              constraints: const BoxConstraints(
                maxHeight: 400,
              ),
              child: HighlightView(
                data.body.substring(1, data.body.length - 2),
                language: 'solidity',
                padding: const EdgeInsets.all(2),
                textStyle: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
                theme: a11yDarkTheme,
              ),
            ),
            TextFormField(
              key: Key('11${data.id}'),
              initialValue: data.body,
              maxLines: 20,
              minLines: 5,
              decoration: const InputDecoration(
                labelText: 'Update Body',
              ),
              onChanged: (value) {
                BlocProvider.of<CodeCubit>(context).updateItem(
                  data.copyWith(body: value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

const a11yDarkTheme = {
  'comment': TextStyle(color: Color(0xffd4d0ab)),
  'quote': TextStyle(color: Color(0xffd4d0ab)),
  'variable': TextStyle(color: Color(0xffffa07a)),
  'template-variable': TextStyle(color: Color(0xffffa07a)),
  'tag': TextStyle(color: Color(0xffffa07a)),
  'name': TextStyle(color: Color(0xffffa07a)),
  'selector-id': TextStyle(color: Color(0xffffa07a)),
  'selector-class': TextStyle(color: Color(0xffffa07a)),
  'regexp': TextStyle(color: Color(0xffffa07a)),
  'deletion': TextStyle(color: Color(0xffffa07a)),
  'number': TextStyle(color: Color(0xfff5ab35)),
  'built_in': TextStyle(color: Color(0xfff5ab35)),
  'builtin-name': TextStyle(color: Color(0xfff5ab35)),
  'literal': TextStyle(color: Color(0xfff5ab35)),
  'type': TextStyle(color: Color(0xfff5ab35)),
  'params': TextStyle(color: Color(0xfff5ab35)),
  'meta': TextStyle(color: Color(0xfff5ab35)),
  'link': TextStyle(color: Color(0xfff5ab35)),
  'attribute': TextStyle(color: Color(0xffffd700)),
  'string': TextStyle(color: Color(0xffabe338)),
  'symbol': TextStyle(color: Color(0xffabe338)),
  'bullet': TextStyle(color: Color(0xffabe338)),
  'addition': TextStyle(color: Color(0xffabe338)),
  'title': TextStyle(color: Color(0xff00e0e0)),
  'section': TextStyle(color: Color(0xff00e0e0)),
  'keyword': TextStyle(color: Color(0xffdcc6e0)),
  'selector-tag': TextStyle(color: Color(0xffdcc6e0)),
  'root':
      TextStyle(backgroundColor: Color(0xff2b2b2b), color: Color(0xfff8f8f2)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
