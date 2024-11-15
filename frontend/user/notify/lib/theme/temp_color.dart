import 'dart:math';
import 'package:flutter/material.dart';

class Tempcolor {
  static Color generateRandomLightColor() {
    final random = Random();
    // final hue = random.nextInt(360);
    // final saturation = 0.4 + random.nextDouble() * 0.4;
    // final lightness = 0.7 + random.nextDouble() * 0.3;

    //return HSLColor.fromAHSL(1.0, hue.toDouble(), saturation, lightness)
    //    .toColor();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}
