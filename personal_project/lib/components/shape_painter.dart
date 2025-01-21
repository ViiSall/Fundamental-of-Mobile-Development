import 'dart:math';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  final int type; // 0: Star, 1: Triangle, 2: Rectangle, 3: Square, 4: Circle
  final Color color;

  ShapePainter({required this.type, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    switch (type) {
      case 0: // Star
        _drawStar(canvas, size, paint);
        break;
      case 1: // Triangle
        _drawTriangle(canvas, size, paint);
        break;
      case 2: // Rectangle
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
        break;
      case 3: // Square
        final side = min(size.width, size.height);
        canvas.drawRect(Rect.fromLTWH(0, 0, side, side), paint);
        break;
      case 4: // Circle
        canvas.drawCircle(Offset(size.width / 2, size.height / 2),
            min(size.width, size.height) / 2, paint);
        break;
    }
  }

  void _drawStar(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    final points = <Offset>[];
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 50; i++) {
      final angle = (pi / 5) * i;
      final offsetRadius = (i % 2 == 0) ? radius : radius / 2;
      points.add(
        Offset(
          center.dx + offsetRadius * cos(angle),
          center.dy + offsetRadius * sin(angle),
        ),
      );
    }

    path.addPolygon(points, true);
    canvas.drawPath(path, paint);
  }

  void _drawTriangle(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
