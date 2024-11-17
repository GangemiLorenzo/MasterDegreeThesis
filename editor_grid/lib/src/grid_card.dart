import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';

enum GridCardItemType {
  value,
  property,
}

class GridCardItem {
  final int id;
  final String title;
  final GridCardItemType type;
  final String? value;
  final GlobalKey? linkKey;

  const GridCardItem._({
    required this.id,
    required this.title,
    required this.type,
    this.linkKey,
    this.value,
  });

  factory GridCardItem.value({
    required int id,
    required String title,
    required String value,
    GlobalKey? linkKey,
  }) =>
      GridCardItem._(
        id: id,
        title: title,
        type: GridCardItemType.value,
        value: value,
        linkKey: linkKey,
      );

  factory GridCardItem.property({
    required int id,
    required String title,
    GlobalKey? linkKey,
  }) =>
      GridCardItem._(
        id: id,
        title: title,
        type: GridCardItemType.property,
        linkKey: linkKey,
      );
}

class GridCard extends StatelessWidget {
  final MyPoint position;
  final List<GridCardItem> properties;
  final String title;
  final bool isSelected;
  final bool isWarning;
  final VoidCallback? onTap;

  const GridCard({
    super.key,
    required this.position,
    required this.properties,
    required this.title,
    this.isSelected = false,
    this.isWarning = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableGridElement(
      id: key.toString(),
      position: position,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 250,
        ),
        child: GestureDetector(
          onTap: onTap,
          // hoverColor: Colors.transparent,
          // splashColor: Colors.transparent,
          // overlayColor: Colors.transparent,,
          // borderRadius: BorderRadius.circular(8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : isWarning
                        ? Colors.amber
                        : Theme.of(context).colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: Card(
              elevation: (isSelected || isWarning) ? 0 : null,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title),
                    Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: properties
                          .map(
                            (e) => Padding(
                              padding: e.type == GridCardItemType.property
                                  ? const EdgeInsets.only(bottom: 4.0, top: 8.0)
                                  : const EdgeInsets.symmetric(vertical: 4.0),
                              child: switch (e.type) {
                                GridCardItemType.value => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        key: e.linkKey,
                                        color: Colors.lightGreen,
                                        height: 10,
                                        width: 10,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        e.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          e.value!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                GridCardItemType.property => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        key: e.linkKey,
                                        color: Colors.red,
                                        height: 10,
                                        width: 10,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(e.title),
                                    ],
                                  ),
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
