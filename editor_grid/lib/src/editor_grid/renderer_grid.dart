import 'package:editor_grid/src/my_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RendererGrid extends MultiChildRenderObjectWidget {
  final Offset dragOffset;
  final double zoomFactor;

  const RendererGrid({
    super.key,
    super.children,
    this.dragOffset = Offset.zero,
    this.zoomFactor = 1,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RendererObjectForGrid(
      dragOffset: dragOffset,
      zoomFactor: zoomFactor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RendererObjectForGrid renderObject) {
    renderObject.dragOffset = dragOffset;
    renderObject.zoomFactor = zoomFactor;
  }
}

class RendererObjectForGrid extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RendererElementParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RendererElementParentData> {
  Offset _dragOffset;
  Offset get dragOffset => _dragOffset;

  set dragOffset(Offset value) {
    if (_dragOffset != value) {
      _dragOffset = value;
      markNeedsLayout();
    }
  }

  double _zoomFactor;
  double get zoomFactor => _zoomFactor;

  set zoomFactor(double value) {
    if (_zoomFactor != value) {
      _zoomFactor = value;
      markNeedsLayout();
    }
  }

  RendererObjectForGrid({
    required Offset dragOffset,
    required double zoomFactor,
  })  : _dragOffset = dragOffset,
        _zoomFactor = zoomFactor;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final canvasCenter = Offset(size.width / 2, size.height / 2);
    final normalizedPosition = position - canvasCenter - dragOffset;
    final scaledPosition = normalizedPosition / _zoomFactor;
    final transformedPosition = scaledPosition + canvasCenter;

    bool isHit = false;
    RenderBox? child = firstChild;
    while (child != null) {
      final RendererElementParentData childParentData =
          child.parentData! as RendererElementParentData;

      final Offset childPosition = transformedPosition - childParentData.offset;

      if (child.hitTest(result, position: childPosition)) {
        result.add(BoxHitTestEntry(child, childPosition));
        isHit = true;
        break;
      }

      child = childParentData.nextSibling;
    }

    return isHit;
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! RendererElementParentData) {
      child.parentData = RendererElementParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData! as RendererElementParentData;
      final adjustedDragOffset = Offset(
          childParentData.dragOffset.dx / _zoomFactor,
          childParentData.dragOffset.dy / _zoomFactor);

      child.layout(constraints.loosen(), parentUsesSize: true);

      childParentData.offset =
          childParentData.customPosition.toFlutterOffset(size) +
              adjustedDragOffset;

      child = childParentData.nextSibling;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    drawCenterCross(canvas);
    canvas.restore();

    final canvasRect = offset & size;
    final adjustedDragOffset =
        Offset(dragOffset.dx / _zoomFactor, dragOffset.dy / _zoomFactor);

    canvas.save();

    Offset canvasCenter = offset + Offset(size.width / 2, size.height / 2);
    canvas.translate(canvasCenter.dx, canvasCenter.dy);

    canvas.scale(_zoomFactor, _zoomFactor);

    canvas.translate(-canvasCenter.dx, -canvasCenter.dy);

    final visibleRect = Rect.fromCenter(
      center: canvasRect.center,
      width: canvasRect.width / _zoomFactor,
      height: canvasRect.height / _zoomFactor,
    );

    canvas.saveLayer(visibleRect, Paint());
    canvas.clipRect(visibleRect);

    //canvas.drawColor(Colors.red.withOpacity(0.2), BlendMode.color);

    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData! as RendererElementParentData;

      final childPosition =
          childParentData.offset + offset + adjustedDragOffset;
      final childBounds = childPosition & child.size;

      if (visibleRect.overlaps(childBounds)) {
        context.paintChild(child, childPosition);
      }

      child = childParentData.nextSibling;
    }

    canvas.restore();

    super.paint(context, offset);
  }

  void drawGrid(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.grey.shade800
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 5) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += 5) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  void drawCenterCross(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.green.shade200
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 - 10),
      Offset(size.width / 2, size.height / 2 + 10),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2 - 10, size.height / 2),
      Offset(size.width / 2 + 10, size.height / 2),
      paint,
    );

    final lightPaint = Paint()
      ..color = Colors.green.shade200
      ..strokeWidth = 0.5;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      lightPaint,
    );

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      lightPaint,
    );
  }

  // void drawLinks(Canvas canvas) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     for (var pair in links) {
  //       final startBox =
  //           pair.startKey.currentContext?.findRenderObject() as RenderBox?;
  //       final endBox =
  //           pair.endKey.currentContext?.findRenderObject() as RenderBox?;
  //       drawLink(
  //         startPosition: MyPoint.fromFlutterOffset(
  //           startBox!.localToGlobal(Offset.zero),
  //           size,
  //         ),
  //         endPosition: MyPoint.fromFlutterOffset(
  //           endBox!.localToGlobal(Offset.zero),
  //           size,
  //         ),
  //         canvas: canvas,
  //       );
  //     }
  //   });
  // }

  void drawLink({
    required MyPoint startPosition,
    required MyPoint endPosition,
    required Canvas canvas,
  }) {
    final flipVertically = startPosition.y < endPosition.y;
    final flipHorizontally = startPosition.x > endPosition.x;

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    if (flipVertically) {
      canvas.translate(0, size.height);
      canvas.scale(1, -1);
    }

    if (flipHorizontally) {
      canvas.translate(size.width, 0);
      canvas.scale(-1, 1);
    }

    final line = Path()..moveTo(0, 0);

    if (flipHorizontally) {
      line.cubicTo(-size.width * 0.8, size.height * 0.2, 1.6 * size.width,
          size.height - size.height * 0.2, size.width, size.height);
    } else {
      line.cubicTo(size.width * 0.8, 0, size.width * 0.2, size.height,
          size.width, size.height);
    }

    final arrow = Path();
    if (flipHorizontally) {
      arrow
        ..moveTo(size.width + 8, size.height - 8)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width + 8, size.height + 8);
    } else {
      arrow
        ..moveTo(size.width - 8, size.height + 8)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width - 8, size.height - 8);
    }

    canvas
      ..drawCircle(const Offset(0, 0), 4, paint)
      ..drawPath(line, paint)
      ..drawPath(arrow, paint);
  }
}

class RendererElementParentData extends ContainerBoxParentData<RenderBox> {
  MyPoint customPosition;
  Offset dragOffset;

  RendererElementParentData({
    this.customPosition = const MyPoint(0, 0),
    this.dragOffset = Offset.zero,
  });
}
