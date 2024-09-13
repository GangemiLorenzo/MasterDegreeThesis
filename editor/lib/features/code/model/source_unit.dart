import 'package:editor/features/code/model/contract.dart';
import 'package:editor/features/code/model/custom_error.dart';
import 'package:editor/features/code/model/enum_definition.dart';
import 'package:editor/features/code/model/event.dart';
import 'package:editor/features/code/model/function_definition.dart';
import 'package:editor/features/code/model/import.dart';
import 'package:editor/features/code/model/pragma.dart';
import 'package:editor/features/code/model/struct.dart';
import 'package:editor/features/code/model/visual_element.dart';
import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_unit.freezed.dart';
part 'source_unit.g.dart';

@freezed
class SourceUnit with _$SourceUnit implements VisualElement {
  const SourceUnit._();

  const factory SourceUnit({
    required String id,
    @Default([]) List<Pragma> pragmas,
    @Default([]) List<Contract> contracts,
    @Default([]) List<Import> imports,
    @Default([]) List<EnumDefinition> enums,
    @Default([]) List<Event> events,
    @Default([]) List<Struct> structs,
    @Default([]) List<FunctionDefinition> functions,
    @Default([]) List<CustomError> errors,
  }) = _SourceUnit;

  factory SourceUnit.fromJson(Map<String, dynamic> json) =>
      _$SourceUnitFromJson(json);

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

    var lastPosition = position ?? const MyPoint(0, 0);
    final vrPragmas = pragmas.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrImports = imports.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrEnums = enums.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrEvents = events.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrStructs = structs.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrFunctions = functions.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    final vrErrors = errors.map((e) {
      final vr = e.toVisualRapresentation(
        context: context,
        fatherId: id,
        position: lastPosition,
      );
      lastPosition = vr.nextPosition ?? lastPosition;
      return vr;
    }).reduceVR();

    return VisualRapresentation(
      cards: [
        ...vrPragmas.cards,
        ...vrImports.cards,
        ...vrEnums.cards,
        ...vrEvents.cards,
        ...vrStructs.cards,
        ...vrFunctions.cards,
        ...vrErrors.cards,
      ],
      links: [
        linkPair,
        ...vrPragmas.links,
        ...vrImports.links,
        ...vrEnums.links,
        ...vrEvents.links,
        ...vrStructs.links,
        ...vrFunctions.links,
        ...vrErrors.links,
      ],
    );
  }

  @override
  VisualElement? findById({
    required String id,
  }) {
    if (id == this.id) {
      return this;
    }

    for (final c in contracts) {
      final result = c.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final p in pragmas) {
      final result = p.findById(id: id);
      if (result != null) {
        return result;
      }
    }

    for (final i in imports) {
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

    for (final e in events) {
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

    for (final f in functions) {
      final result = f.findById(id: id);
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

    for (var i = 0; i < contracts.length; i++) {
      final result = contracts[i].replaceById(id: id, element: element);
      if (result != null) {
        final newContracts = List<Contract>.from(contracts);
        newContracts[i] = result as Contract;
        return copyWith(contracts: newContracts);
      }
    }

    for (var i = 0; i < pragmas.length; i++) {
      final result = pragmas[i].replaceById(id: id, element: element);
      if (result != null) {
        final newPragmas = List<Pragma>.from(pragmas);
        newPragmas[i] = result as Pragma;
        return copyWith(pragmas: newPragmas);
      }
    }

    for (var i = 0; i < imports.length; i++) {
      final result = imports[i].replaceById(id: id, element: element);
      if (result != null) {
        final newImports = List<Import>.from(imports);
        newImports[i] = result as Import;
        return copyWith(imports: newImports);
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

    for (var i = 0; i < events.length; i++) {
      final result = events[i].replaceById(id: id, element: element);
      if (result != null) {
        final newEvents = List<Event>.from(events);
        newEvents[i] = result as Event;
        return copyWith(events: newEvents);
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

    for (var i = 0; i < functions.length; i++) {
      final result = functions[i].replaceById(id: id, element: element);
      if (result != null) {
        final newFunctions = List<FunctionDefinition>.from(functions);
        newFunctions[i] = result as FunctionDefinition;
        return copyWith(functions: newFunctions);
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
  Widget toDetailsForm({
    List<LinkPair> links = const [],
  }) =>
      Container();
}
