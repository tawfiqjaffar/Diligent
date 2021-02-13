import 'package:Diligent/config/palette.dart';
import 'package:flutter/material.dart';

class Style {
  static List<BoxShadow> containerShadow = [
    BoxShadow(
      color: Colors.grey[400],
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 5), // changes position of shadow
    ),
  ];
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.grey[400],
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ];
}
