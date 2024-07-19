import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';

extension VisualRapresentationListExtension on Iterable<VisualRapresentation> {
  VisualRapresentation reduceVR() {
    if (isEmpty) {
      return VisualRapresentation(cards: [], links: []);
    }
    return reduce((a, b) => a.merge(b));
  }
}

class VisualRapresentation {
  final List<Widget> cards;
  final List<LinkPair> links;
  final MyPoint? nextPosition;

  VisualRapresentation({
    required this.cards,
    this.links = const [],
    this.nextPosition,
  });

  VisualRapresentation copyWith({
    List<Widget>? cards,
    List<LinkPair>? links,
  }) {
    return VisualRapresentation(
      cards: cards ?? this.cards,
      links: links ?? this.links,
    );
  }

  VisualRapresentation merge(VisualRapresentation other) {
    return VisualRapresentation(
      cards: [...cards, ...other.cards],
      links: [...links, ...other.links],
    );
  }
}

abstract class VisualElement {
  VisualRapresentation toVisualRapresentation({
    required BuildContext context,
    MyPoint? position,
  });

  Widget toDetailsForm();

  VisualElement? findById({
    required String id,
  });

  VisualElement? replaceById({
    required String id,
    required VisualElement element,
  });

  String get id;
}
