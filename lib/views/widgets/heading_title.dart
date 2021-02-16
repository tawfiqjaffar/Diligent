import 'package:Diligent/config/palette.dart';
import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  final String title;

  const HeadingTitle({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        child: Text(
          this.title,
          style: const TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
