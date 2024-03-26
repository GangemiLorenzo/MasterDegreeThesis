import 'package:client/grid_element.dart';
import 'package:client/my_point.dart';
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

  const GridCard({
    super.key,
    required this.position,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    //final connectionProvider = ConnectionProvider.of(context);

    return DraggableGridElement(
      position: position,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 200,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: properties
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                              Text(e.title),
                              const Spacer(),
                              Text(e.value!),
                            ],
                          ),
                        GridCardItemType.property => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(e.title),
                              const SizedBox(width: 8),
                              Container(
                                key: e.linkKey,
                                color: Colors.red,
                                height: 10,
                                width: 10,
                              )
                            ],
                          ),
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
