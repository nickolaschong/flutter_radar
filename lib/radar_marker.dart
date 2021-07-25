import 'dart:math';

import 'package:flutter/material.dart';

class TickMarker extends StatelessWidget {
  const TickMarker({
    Key? key,
    required this.index,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int index;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 1.0;
    const longMarkerLength = 20.0;
    const shortMarkerLength = 5.0;

    final height = index % 10 == 0 ? longMarkerLength : shortMarkerLength;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (index / maxValue))
        ..translate(0.0, radius - longMarkerLength, 0.0),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xff5DC05F),
      ),
    );
  }
}

class NumberMarker extends StatelessWidget {
  const NumberMarker({
    Key? key,
    required this.index,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int index;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 18.0;
    const height = 18.0;
    const fontSize = 10.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (index / maxValue))
        ..translate(0.0, radius, 0.0)
        ..rotateZ(pi - 2 * pi * (index / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            index.toString(),
            style: const TextStyle(
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
