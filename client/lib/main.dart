import 'package:client/editor_grid/editor_grid.dart';
import 'package:client/grid_card.dart';
import 'package:client/my_point.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreenAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Editor',
                        style: Theme.of(context).typography.dense.headlineLarge,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: EditorGrid(
                  children: [
                    GridCard(
                      position: const MyPoint(-200, 300),
                      properties: [
                        GridCardItem.value(
                          id: 0,
                          title: 'Name',
                          value: 'Lorenzo',
                        ),
                        GridCardItem.property(
                          id: 1,
                          title: 'Some property',
                        ),
                        GridCardItem.value(
                          id: 2,
                          title: 'Surname',
                          value: 'Gangemi',
                        ),
                        GridCardItem.property(
                          id: 3,
                          title: 'Year',
                        ),
                      ],
                    ),
                    GridCard(
                      position: const MyPoint(100, 100),
                      properties: [
                        GridCardItem.value(
                          id: 4,
                          title: 'year',
                          value: '26',
                        ),
                      ],
                    ),
                    GridCard(
                      position: const MyPoint(-400, -100),
                      properties: [
                        GridCardItem.property(
                          id: 5,
                          title: 'Year',
                        ),
                      ],
                    ),
                    GridCard(
                      position: const MyPoint(-350, -400),
                      properties: [
                        GridCardItem.value(
                          id: 6,
                          title: 'value',
                          value: '123.63',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
