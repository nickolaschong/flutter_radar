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
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
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
    const milliSecondsPerRound = 1500;
    final width = widget.radius * 2;
    final height = widget.radius * 2;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ((2 * pi / milliSecondsPerRound) * _elapsed.inMilliseconds),
      child: CustomPaint(
        painter: ArcPainter(),
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect = Rect.fromCircle(center: center, radius: size.width / 2);
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.transparent,
          Colors.green,
        ],
      ).createShader(rect);

    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: size.width,
        height: size.height,
      ),
      220 * pi / 180,
      pi / 2,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
