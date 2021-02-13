import 'dart:math';

import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color primary = Color(0xFF4B79A1);
  static const Color secondary = Color(0xFF0f5ea3);
  static const Color red1 = Color(0xFFFFF5656);
  static const Color red2 = Color(0xFFda6804);
  static const Color blue1 = Color(0xFF008298);
  static const Color blue2 = Color(0xFF0442da);
  static const Color green1 = Color(0xFF319800);
  static const Color green2 = Color(0xFF04cada);
  static const List<List<Color>> gradients = [
    [red1, red2],
    [blue1, blue2],
    [green1, green2],
  ];

  static List<Color> getRandomGradient() {
    Random random = new Random();
    int randomNumber = random.nextInt(gradients.length);
    return gradients[randomNumber];
  }
}
