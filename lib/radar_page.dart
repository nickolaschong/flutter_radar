import 'package:flutter/material.dart';
import 'package:flutter_radar/grid_painter.dart';
import 'package:flutter_radar/radar.dart';

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
          const Center(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Radar(),
            ),
          )
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
}
