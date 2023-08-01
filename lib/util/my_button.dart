import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  var textColor;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    this.textColor= Colors.blue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: textColor,
      child: Text(text),
    );
  }
}