import 'package:Diligent/config/palette.dart';
import 'package:flutter/material.dart';

class DashboardHeading extends StatelessWidget {
  final String text;

  const DashboardHeading({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Palette.primary,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
