import 'package:editor_grid/src/my_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LinksRendererGrid extends MultiChildRenderObjectWidget {
  final Offset dragOffset;

  const LinksRendererGrid({
    super.key,
    super.children,
    this.dragOffset = Offset.zero,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RendererObjectForLinksGrid(
      dragOffset: dragOffset,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RendererObjectForLinksGrid renderObject) {
    renderObject.dragOffset = dragOffset;
  }
}

class LinkRendererElementParentData extends ContainerBoxParentData<RenderBox> {
  MyPoint customPosition;

  LinkRendererElementParentData({this.customPosition = const MyPoint(0, 0)});
}

class RendererObjectForLinksGrid extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, LinkRendererElementParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            LinkRendererElementParentData> {
  Offset _dragOffset;
  Offset get dragOffset => _dragOffset;

  set dragOffset(Offset value) {
    if (_dragOffset != value) {
      _dragOffset = value;
      markNeedsLayout();
    }
  }

  RendererObjectForLinksGrid({
    required Offset dragOffset,
  }) : _dragOffset = dragOffset;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! LinkRendererElementParentData) {
      child.parentData = LinkRendererElementParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData =
          child.parentData! as LinkRendererElementParentData;

      child.layout(constraints.loosen(), parentUsesSize: true);

      childParentData.offset =
          childParentData.customPosition.toFlutterOffset(size);

      child = childParentData.nextSibling;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData =
          child.parentData! as LinkRendererElementParentData;

      context.paintChild(child, childParentData.offset + offset + dragOffset);

      child = childParentData.nextSibling;
    }

    super.paint(context, offset);
  }
}
