import 'package:flutter/material.dart';

class RadarTarget extends StatelessWidget {
  const RadarTarget({
    Key? key,
    required this.radius,
    required this.color,
  }) : super(key: key);

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            color,
            Colors.transparent,
          ],
          stops: const [
            0.2,
            1,
          ],
        ),
      ),
    );
  }
}
