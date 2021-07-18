import 'package:flutter/material.dart';
import 'package:flutter_radar/concentric_circle_painter.dart';
import 'package:flutter_radar/grid_painter.dart';

class RadarPage extends StatelessWidget {
  const RadarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar 📡'),
      ),
      body: Stack(
        children: [
          _drawGridBackground(),
          _drawRadar(context),
          // _buildRadar(context),
        ],
      ),
    );
  }

  CustomPaint _drawGridBackground() {
    return CustomPaint(
      painter: GridPainter(
        color: Colors.green,
        strokeWidth: 0.3,
        gridSize: 30,
      ),
      child: Container(),
    );
  }

  Widget _drawRadar(context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Colors.green.shade900,
            ),
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
          child: CustomPaint(
            painter: ConcentricCirclePainter(
              color: Colors.green.shade900,
              strokeWidth: 1,
              spacing: 25,
              offSet: 20,
            ),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
