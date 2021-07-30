import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_radar/concentric_circle_painter.dart';
import 'package:flutter_radar/radar_arc.dart';
import 'package:flutter_radar/radar_marker.dart';
import 'package:flutter_radar/radar_target.dart';

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
              ..._drawNeutralTarget(radius, Colors.blueGrey),
              ..._drawEnemyTarget(radius, Colors.red),
              Positioned(
                left: radius,
                top: radius,
                child: RadarArc(radius: radius * 0.82),
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

  List<Widget> _drawNeutralTarget(radius, color) {
    final size = radius * 0.1;

    var coordinates = <Point<double>>[
      Point(radius * 0.5, radius * 0.5),
      Point(radius * 0.5, radius * 0.7),
      Point(radius * 0.45, radius * 1.4),
      Point(radius * 1.2, radius * 0.8),
    ];

    return [
      for (var i = 0; i < coordinates.length; i++)
        Positioned(
          left: coordinates[i].x,
          top: coordinates[i].y,
          child: RadarTarget(
            radius: size,
            color: color,
          ),
        ),
    ];
  }

  List<Widget> _drawEnemyTarget(radius, color) {
    final size = radius * 0.1;

    var coordinates = <Point<double>>[
      Point(radius * 1.15, radius * 1.3),
      Point(radius * 1.25, radius * 1.2),
      Point(radius * 1.2, radius * 1.45),
      Point(radius * 1.4, radius * 1.25),
    ];

    return [
      for (var i = 0; i < coordinates.length; i++)
        Positioned(
          left: coordinates[i].x,
          top: coordinates[i].y,
          child: RadarTarget(
            radius: size,
            color: color,
          ),
        ),
    ];
  }
}
