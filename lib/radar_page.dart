import 'package:flutter/material.dart';
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
          _buildBackground(),
          _buildRadar(context),
        ],
      ),
    );
  }

  CustomPaint _buildBackground() {
    return CustomPaint(
      painter: GridPainter(
        color: Colors.green,
        strokeWidth: 0.3,
        gridSize: 30,
      ),
      child: Container(),
    );
  }

  Widget _buildRadar(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
