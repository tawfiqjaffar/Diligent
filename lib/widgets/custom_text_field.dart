import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;

  const CustomTextField({
    Key key,
    this.textHint,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      autocorrect: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(width: 1, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(width: 1, color: Colors.transparent),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: textHint != null ? textHint : "",
        labelStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 20.0,
        ),
      ),
    );
  }
}
