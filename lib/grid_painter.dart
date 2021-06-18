import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  GridPainter({
    required this.color,
    required this.strokeWidth,
    required this.gridSize,
    this.horizontalOffset = 15,
    this.verticalOffset = 10,
  });

  final Color? color;
  final double strokeWidth;
  final int gridSize;
  final int horizontalOffset;
  final int verticalOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..strokeWidth = strokeWidth;

    // Draw horizontal line
    for (var i = horizontalOffset; i <= size.height; i += gridSize) {
      final startingPoint = Offset(0, i.toDouble());
      final endingPoint = Offset(size.width, i.toDouble());
      canvas.drawLine(startingPoint, endingPoint, paint);
    }

    // Draw vertical line
    for (var i = verticalOffset; i <= size.width; i += gridSize) {
      final startingPoint = Offset(i.toDouble(), 0);
      final endingPoint = Offset(i.toDouble(), size.height);
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
