import 'package:editor_grid/src/grid_element.dart';
import 'package:editor_grid/src/my_point.dart';
import 'package:flutter/material.dart';

class GridLink extends StatelessWidget {
  final MyPoint startPosition;
  final MyPoint endPosition;

  const GridLink({
    super.key,
    required this.startPosition,
    required this.endPosition,
  });

  MyPoint get position => MyPoint(
        (startPosition.x < endPosition.x) ? startPosition.x : endPosition.x,
        (startPosition.y > endPosition.y) ? startPosition.y : endPosition.y,
      );

  @override
  Widget build(BuildContext context) {
    return LinkGridElement(
      position: position,
      child: SizedBox(
        height: (startPosition.y - endPosition.y).abs(),
        width: (startPosition.x - endPosition.x).abs(),
        child: CustomPaint(
          painter: GridLinkPainter(
            startPosition: startPosition,
            endPosition: endPosition,
          ),
        ),
      ),
    );
  }
}

class GridLinkPainter extends CustomPainter {
  final MyPoint startPosition;
  final MyPoint endPosition;

  GridLinkPainter({
    super.repaint,
    required this.startPosition,
    required this.endPosition,
  });

  bool get flipVertically => startPosition.y < endPosition.y;
  bool get flipHorizontally => startPosition.x > endPosition.x;

  @override
  void paint(Canvas canvas, Size size) {
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
