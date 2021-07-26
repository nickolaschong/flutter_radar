import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RadarArc extends StatefulWidget {
  const RadarArc({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  _RadarArcState createState() => _RadarArcState();
}

class _RadarArcState extends State<RadarArc>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _currentlyElapsed = Duration.zero;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(0.0, 0.0, 0.0)
        ..rotateZ((2 * pi / 2500) * _currentlyElapsed.inMilliseconds),
      child: Container(
        color: Colors.transparent,
        height: widget.radius * 2,
        width: widget.radius * 2,
        child: CustomPaint(
          painter: ArcPainter(),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset _center = Offset(size.width / 2, size.height / 2);

    final rect = Rect.fromCircle(center: _center, radius: size.width / 4);

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          Colors.green.shade900,
        ],
      ).createShader(rect);

    var paint2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawArc(
        Rect.fromCenter(
          center: _center,
          width: size.width,
          height: size.height,
        ),
        250 * pi / 180,
        pi / 4,
        true,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
