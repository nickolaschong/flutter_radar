import 'package:flutter/material.dart';

class ConcentricCirclePainter extends CustomPainter {
  ConcentricCirclePainter({
    required this.color,
    required this.strokeWidth,
    this.spacing = 15,
    this.offSet = 0,
  });

  final Color? color;
  final double strokeWidth;
  final int spacing;
  final int offSet;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double maxRadius = size.width / 2 - offSet;

    while (maxRadius > 0) {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), maxRadius, paint);
      maxRadius -= spacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
