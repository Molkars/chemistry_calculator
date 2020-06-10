import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  final Color color;

  const GradientPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    for (int y = 0; y < size.height; y++) {
      final Gradient g = LinearGradient(
        colors: [
          Color.lerp(Colors.white, Colors.black, y / size.height),
          Color.lerp(color, Colors.black, y / size.height),
        ],
        stops: [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
      canvas.drawLine(Offset(0, y.toDouble()), Offset(size.width, y.toDouble()), Paint()
        ..strokeWidth = 3
        ..shader = g.createShader(Offset.zero & size));
    }
  }

  @override
  bool shouldRepaint(GradientPainter oldDelegate) => oldDelegate != this;

  Color getColorAtPoint(Offset point) {
    double x = point.dx, y = point.dy;
    assert(x >= 0 && x <= 1);
    assert(y >= 0 && y <= 1);

    return Color.lerp(
        Color.lerp(Colors.white, Colors.black, y),
        Color.lerp(color, Colors.black, y),
        x
    );
  }
}
