import 'dart:ui';

/// A point in 2D space
class MyPoint {
  final double x, y;

  const MyPoint(this.x, this.y);

  /// Create a point at the origin (0, 0)
  factory MyPoint.origin() => const MyPoint(0, 0);

  /// Convert the point to a Flutter Offset, based on the canvas
  Offset toFlutterOffset(Size canvasSize) {
    double offsetX = (canvasSize.width / 2) + x;
    double offsetY = (canvasSize.height / 2) - y;
    return Offset(offsetX, offsetY);
  }

  /// Convert a Flutter Offset to a Point, based on the canvas
  static MyPoint fromFlutterOffset(Offset offset, Size canvasSize) {
    double x = offset.dx - (canvasSize.width / 2);
    double y = (canvasSize.height / 2) - offset.dy;

    return MyPoint(x, y);
  }

  /// Add another point to this point
  MyPoint drag(MyPoint offset) {
    double sumX = x + offset.x;
    double sumY = y - offset.y;
    return MyPoint(sumX, sumY);
  }

  @override
  String toString() => 'Point($x, $y)';
}
