import 'dart:math';

import 'package:editor_grid/editor_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RendererGrid extends MultiChildRenderObjectWidget {
  final Offset dragOffset;
  final double zoomFactor;
  final List<LinkPair> connections;

  const RendererGrid({
    super.key,
    super.children,
    this.dragOffset = Offset.zero,
    this.zoomFactor = 1,
    required this.connections,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RendererObjectForGrid(
      dragOffset: dragOffset,
      zoomFactor: zoomFactor,
      connections: connections,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RendererObjectForGrid renderObject) {
    renderObject.dragOffset = dragOffset;
    renderObject.zoomFactor = zoomFactor;
    renderObject.connections = connections;
  }
}

class RendererObjectForGrid extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RendererElementParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RendererElementParentData> {
  Offset _dragOffset;
  double _zoomFactor;
  List<LinkPair> _connections;

  Offset get dragOffset => _dragOffset;
  double get zoomFactor => _zoomFactor;
  List<LinkPair> get connections => _connections;

  set dragOffset(Offset value) {
    if (_dragOffset != value) {
      _dragOffset = value;
      markNeedsPaint();
    }
  }

  set zoomFactor(double value) {
    if (_zoomFactor != value) {
      _zoomFactor = value;
      markNeedsPaint();
    }
  }

  set connections(List<LinkPair> value) {
    if (_connections != value) {
      _connections = value;
      markNeedsPaint();
    }
  }

  RendererObjectForGrid({
    required Offset dragOffset,
    required double zoomFactor,
    required List<LinkPair> connections,
  })  : _dragOffset = dragOffset,
        _zoomFactor = zoomFactor,
        _connections = connections;

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
      child.parentData = RendererElementParentData(
        id: UniqueKey().toString(),
      );
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

    for (final connection in _connections) {
      final startChild = _findChildById(connection.startId);
      final endChild = _findChildById(connection.endId);

      if (startChild != null && endChild != null) {
        final startOffset = _getChildOffset(startChild);
        final endOffset = _getChildOffset(endChild);

        final startPoint = startOffset +
            offset +
            Offset(startChild.size.width, startChild.size.height / 2);
        final endPoint =
            endOffset + offset + Offset(0, endChild.size.height / 2);

        paintLine(
          canvas: canvas,
          startPoint: startPoint,
          endPoint: endPoint,
          text: connection.operation,
          color: connection.color,
        );
      }
    }

    super.paint(context, offset);
  }

  void paintLine({
    required Offset startPoint,
    required Offset endPoint,
    required Canvas canvas,
    String? text,
    Color? color,
  }) {
    final paint = Paint()
      ..color = color ?? Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.save();

    final line = Path()..moveTo(startPoint.dx, startPoint.dy);

    // Calculate control points for the cubic Bezier curve
    final midX = (startPoint.dx + endPoint.dx) / 2;
    final controlPoint1 = Offset(midX, startPoint.dy);
    final controlPoint2 = Offset(midX, endPoint.dy);

    // Add the cubic Bezier curve
    line.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Draw start point circle
    canvas.drawCircle(startPoint, 4, paint);

    // Draw the curve
    canvas.drawPath(line, paint);

    // Draw end point circle
    canvas.drawCircle(endPoint, 4, paint);

    // Draw an arrow at the end point
    final arrowPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final arrowPath = Path();
    const arrowSize = 10.0;
    final angle = (endPoint - controlPoint2).direction;
    final arrowPoint1 =
        endPoint + Offset.fromDirection(angle - pi * 3 / 4, arrowSize);
    final arrowPoint2 =
        endPoint + Offset.fromDirection(angle + pi * 3 / 4, arrowSize);

    arrowPath.moveTo(endPoint.dx, endPoint.dy);
    arrowPath.lineTo(arrowPoint1.dx, arrowPoint1.dy);
    arrowPath.lineTo(arrowPoint2.dx, arrowPoint2.dy);
    arrowPath.close();

    canvas.drawPath(arrowPath, arrowPaint);

    // Draw text in the middle of the line
    if (text != null && text.isNotEmpty) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            backgroundColor: Colors.white.withOpacity(0.7),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Calculate the position for the text
      final midPoint = Offset(
        (startPoint.dx + endPoint.dx) / 2,
        (startPoint.dy + endPoint.dy) / 2,
      );

      // Draw a background for the text
      final textBackgroundRect = Rect.fromCenter(
        center: midPoint,
        width: textPainter.width + 8,
        height: textPainter.height + 4,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(textBackgroundRect, const Radius.circular(4)),
        Paint()..color = Colors.white.withOpacity(0.7),
      );

      // Draw the text
      textPainter.paint(
        canvas,
        midPoint.translate(-textPainter.width / 2, -textPainter.height / 2),
      );
    }

    canvas.restore();
  }

  RenderBox? _findChildById(String id) {
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData! as RendererElementParentData;
      final childId =
          childParentData.id.substring(3, childParentData.id.length - 3);
      if (childId == id) {
        return child;
      }
      child = childParentData.nextSibling;
    }
    return null;
  }

  Offset _getChildOffset(RenderBox child) {
    final childParentData = child.parentData! as RendererElementParentData;
    return childParentData.offset + dragOffset;
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
  String id;

  RendererElementParentData({
    this.customPosition = const MyPoint(0, 0),
    this.dragOffset = Offset.zero,
    required this.id,
  });
}
