import 'dart:math';

import 'package:editor_grid/src/editor_grid/connection_provider.dart';
import 'package:editor_grid/src/editor_grid/renderer_grid.dart';
import 'package:flutter/material.dart';

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
        final difference =
            Offset(details.focalPointDelta.dx, details.focalPointDelta.dy);
        const zoomDifference = 0;
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
          connections: widget.links,
          child: Builder(builder: (context) {
            final connectionProvider = ConnectionProvider.of(context);

            return Positioned.fill(
              child: RendererGrid(
                zoomFactor: zoomFactor,
                dragOffset: dragOffset,
                connections: connectionProvider?.validConnections ?? [],
                children: widget.children,
              ),
            );
          }),
        ),
      ),
    );
  }
}
