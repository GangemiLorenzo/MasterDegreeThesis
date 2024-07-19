import 'package:editor_grid/src/editor_grid/links_renderer_grid.dart';
import 'package:editor_grid/src/editor_grid/renderer_grid.dart';
import 'package:editor_grid/src/my_point.dart';
import 'package:flutter/material.dart';

class GridElement extends ParentDataWidget<RendererElementParentData> {
  final MyPoint position;
  final Offset dragOffset;

  const GridElement({
    super.key,
    required super.child,
    required this.position,
    this.dragOffset = Offset.zero,
  });

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is RendererElementParentData);
    final RendererElementParentData parentData =
        renderObject.parentData as RendererElementParentData;
    if (parentData.customPosition != position) {
      parentData.customPosition = position;
      final RenderObject? ro = renderObject.parent;
      if (ro is RenderObject) ro.markNeedsLayout();
    }
    if (parentData.dragOffset != dragOffset) {
      parentData.dragOffset = dragOffset;
      final RenderObject? ro = renderObject.parent;
      if (ro is RenderObject) ro.markNeedsLayout();
    }
    renderObject.parentData = parentData;
    renderObject.parent!.parentData = parentData;
  }

  @override
  Type get debugTypicalAncestorWidgetClass => GridElement;
}

class DraggableGridElement extends StatefulWidget {
  final MyPoint position;
  final Widget child;

  const DraggableGridElement({
    super.key,
    required this.position,
    required this.child,
  });

  @override
  State<DraggableGridElement> createState() => _DraggableGridElementState();
}

class _DraggableGridElementState extends State<DraggableGridElement> {
  late Offset dragOffset;

  @override
  void initState() {
    dragOffset = Offset.zero;
    super.initState();
  }

  @override
  void dispose() {
    dragOffset = Offset.zero;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridElement(
      position: widget.position,
      dragOffset: dragOffset,
      child: GestureDetector(
        onPanUpdate: (details) {
          debugPrint('Pan update element');
          final difference = Offset(details.delta.dx, details.delta.dy);
          setState(() {
            dragOffset = dragOffset.translate(difference.dx, difference.dy);
          });
        },
        child: widget.child,
      ),
    );
  }
}

class LinkGridElement extends ParentDataWidget<LinkRendererElementParentData> {
  final MyPoint position;

  const LinkGridElement({
    super.key,
    required super.child,
    required this.position,
  });

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is LinkRendererElementParentData);
    final LinkRendererElementParentData parentData =
        renderObject.parentData as LinkRendererElementParentData;
    if (parentData.customPosition != position) {
      parentData.customPosition = position;
      final RenderObject? ro = renderObject.parent;
      if (ro is RenderObject) ro.markNeedsLayout();
    }
    renderObject.parentData = parentData;
    renderObject.parent!.parentData = parentData;
  }

  @override
  Type get debugTypicalAncestorWidgetClass => LinkGridElement;
}
