import 'dart:math';

import 'package:flutter/material.dart';
import 'package:client/editor_grid/renderer_grid.dart';

class EditorGrid extends StatefulWidget {
  final List<Widget> children;
  final List<LinkPair> links;

  const EditorGrid({
    required this.children,
    this.links = const [],
    super.key,
  });

  @override
  State<EditorGrid> createState() => _EditorGridState();
}

class _EditorGridState extends State<EditorGrid> {
  late Offset dragOffset;
  late double lastZoomFactor;
  late double zoomFactor;

  @override
  void initState() {
    dragOffset = Offset.zero;
    lastZoomFactor = 1;
    zoomFactor = 1;

    super.initState();
  }

  @override
  void dispose() {
    dragOffset = Offset.zero;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onScaleUpdate: (ScaleUpdateDetails details) {
        debugPrint('Scale update');
        final difference =
            Offset(details.focalPointDelta.dx, details.focalPointDelta.dy);
        debugPrint('scale: ${details.scale}');
        final zoomDifference = details.scale - 1;
        setState(() {
          zoomFactor = min(max(lastZoomFactor + zoomDifference, 0.5), 3);
          dragOffset = dragOffset.translate(difference.dx, difference.dy);
        });
      },
      onScaleEnd: (_) {
        setState(() {
          lastZoomFactor = zoomFactor;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: ConnectionProvider(
          connections: const [],
          child: RendererGrid(
            zoomFactor: zoomFactor,
            dragOffset: dragOffset,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}

class ConnectionProvider extends InheritedWidget {
  final List<LinkPair> connections;

  const ConnectionProvider({
    super.key,
    required super.child,
    required this.connections,
  });

  static ConnectionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConnectionProvider>();
  }

  @override
  bool updateShouldNotify(ConnectionProvider oldWidget) {
    return connections != oldWidget.connections;
  }

  void addConnection(LinkPair connection) {
    connections.add(connection);
  }
}

class LinkPair {
  final int startId;
  final int endId;

  LinkPair({
    required this.startId,
    required this.endId,
  });
}
