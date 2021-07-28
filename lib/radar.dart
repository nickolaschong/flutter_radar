import 'package:flutter/material.dart';
import 'package:flutter_radar/concentric_circle_painter.dart';
import 'package:flutter_radar/radar_arc.dart';
import 'package:flutter_radar/radar_marker.dart';

class Radar extends StatelessWidget {
  const Radar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: LayoutBuilder(builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;

        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            gradient: RadialGradient(
              colors: [
                Colors.black87,
                Colors.green.shade900,
              ],
              stops: const [
                0.68,
                1,
              ],
            ),
          ),
          child: Stack(
            children: [
              _drawConcentricCircle(),
              for (var i = 0; i < 360; i++)
                Positioned(
                  left: radius,
                  top: radius,
                  child: TickMarker(
                    index: i,
                    maxValue: 360,
                    radius: radius - 12,
                  ),
                ),
              for (var i = 0; i < 360; i += 10)
                Positioned(
                  left: radius,
                  top: radius,
                  child: NumberMarker(
                    index: i,
                    maxValue: 360,
                    radius: radius - 10,
                  ),
                ),
              Positioned(
                left: radius,
                top: radius,
                child: RadarArc(radius: radius * 0.76),
              ),
            ],
          ),
        );
      }),
    );
  }

  CustomPaint _drawConcentricCircle() {
    return CustomPaint(
      painter: ConcentricCirclePainter(
        color: Colors.green.shade900,
        strokeWidth: 1,
        spacing: 25,
        offSet: 20,
      ),
      child: Container(),
    );
  }
}
