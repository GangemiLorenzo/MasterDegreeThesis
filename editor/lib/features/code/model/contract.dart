import 'package:editor/features/code/model/custom_error.dart';
import 'package:editor/features/code/model/enum_definition.dart';
import 'package:editor/features/code/model/event.dart';
import 'package:editor/features/code/model/function_definition.dart';
import 'package:editor/features/code/model/inheritance.dart';
import 'package:editor/features/code/model/modifier.dart';
import 'package:editor/features/code/model/struct.dart';
import 'package:editor/features/code/model/variable.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/src/my_point.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract.freezed.dart';
part 'contract.g.dart';

@freezed
class Contract with _$Contract implements VisualElement {
  const Contract._();

  const factory Contract({
    required String id,
    required String name,
    @Default(false) bool isInterface,
    @Default(false) bool isLibrary,
    @Default([]) List<Variable> variables,
    @Default([]) List<FunctionDefinition> functions,
    @Default([]) List<Modifier> modifiers,
    @Default([]) List<Event> events,
    @Default([]) List<Inheritance> inheritance,
    @Default([]) List<EnumDefinition> enums,
    @Default([]) List<Struct> structs,
    @Default([]) List<CustomError> errors,
  }) = _Contract;

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  @override
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    MyPoint? position,
  }) {
    var lastPosition = position ?? const MyPoint(0, 0);
    final vrVariables = variables.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrFunctions = functions.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrModifiers = modifiers.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrEvents = events.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrInheritance = inheritance.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrEnums = enums.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrStructs = structs.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    final vrErrors = errors.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();
    return VisualRapresentation(
      cards: [
        ...vrFunctions.cards,
        ...vrVariables.cards,
        ...vrModifiers.cards,
        ...vrEvents.cards,
        ...vrInheritance.cards,
        ...vrEnums.cards,
        ...vrStructs.cards,
        ...vrErrors.cards,
      ],
      links: [
        ...vrVariables.links,
        ...vrFunctions.links,
        ...vrModifiers.links,
        ...vrEvents.links,
        ...vrInheritance.links,
        ...vrEnums.links,
        ...vrStructs.links,
        ...vrErrors.links,
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

    for (final v in variables) {
      final result = v.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final f in functions) {
      final result = f.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final m in modifiers) {
      final result = m.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final e in events) {
      final result = e.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final i in inheritance) {
      final result = i.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final e in enums) {
      final result = e.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final s in structs) {
      final result = s.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final e in errors) {
      final result = e.findById(id: id);
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

    for (var i = 0; i < variables.length; i++) {
      final result = variables[i].replaceById(id: id, element: element);
      if (result != null) {
        final newVariables = List<Variable>.from(variables);
        newVariables[i] = result as Variable;
        return copyWith(variables: newVariables);
      }
    }

    for (var i = 0; i < functions.length; i++) {
      final result = functions[i].replaceById(id: id, element: element);
      if (result != null) {
        final newFunctions = List<FunctionDefinition>.from(functions);
        newFunctions[i] = result as FunctionDefinition;
        return copyWith(functions: newFunctions);
      }
    }

    for (var i = 0; i < modifiers.length; i++) {
      final result = modifiers[i].replaceById(id: id, element: element);
      if (result != null) {
        final newModifiers = List<Modifier>.from(modifiers);
        newModifiers[i] = result as Modifier;
        return copyWith(modifiers: newModifiers);
      }
    }

    for (var i = 0; i < events.length; i++) {
      final result = events[i].replaceById(id: id, element: element);
      if (result != null) {
        final newEvents = List<Event>.from(events);
        newEvents[i] = result as Event;
        return copyWith(events: newEvents);
      }
    }

    for (var i = 0; i < inheritance.length; i++) {
      final result = inheritance[i].replaceById(id: id, element: element);
      if (result != null) {
        final newInheritance = List<Inheritance>.from(inheritance);
        newInheritance[i] = result as Inheritance;
        return copyWith(inheritance: newInheritance);
      }
    }

    for (var i = 0; i < enums.length; i++) {
      final result = enums[i].replaceById(id: id, element: element);
      if (result != null) {
        final newEnums = List<EnumDefinition>.from(enums);
        newEnums[i] = result as EnumDefinition;
        return copyWith(enums: newEnums);
      }
    }

    for (var i = 0; i < structs.length; i++) {
      final result = structs[i].replaceById(id: id, element: element);
      if (result != null) {
        final newStructs = List<Struct>.from(structs);
        newStructs[i] = result as Struct;
        return copyWith(structs: newStructs);
      }
    }

    for (var i = 0; i < errors.length; i++) {
      final result = errors[i].replaceById(id: id, element: element);
      if (result != null) {
        final newErrors = List<CustomError>.from(errors);
        newErrors[i] = result as CustomError;
        return copyWith(errors: newErrors);
      }
    }

    return null;
  }

  @override
  Widget toDetailsForm() => Container();
}