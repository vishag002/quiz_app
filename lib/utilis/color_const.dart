import 'package:flutter/material.dart';

class ColorConst {
  static Color textColor = Colors.grey.shade900;
  static Color primary = Colors.white;
  static Color secondary = Colors.yellow.shade600;
  static Color background = Colors.black;
  static const Gradient backgroundG = SweepGradient(
      colors: [
        Colors.yellow,
        Colors.yellow,
        Colors.yellow,
        Colors.yellow,
        Colors.yellow,
        Colors.orange,
        Colors.yellow,
        Colors.yellow,
        Colors.yellow,
      ],
      endAngle: 15,
      center: Alignment.topCenter,
      tileMode: TileMode.repeated,
      transform: GradientRotation(5),
      startAngle: 5);
}
