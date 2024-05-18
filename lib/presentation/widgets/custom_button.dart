import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.buttonColor,
      required this.textButtonColor});

  final String text;
  final Color buttonColor;
  final Color textButtonColor;
  final VoidCallback? onPressed;

  static const fontSize = 16.0;
  static const buttonWidth = 444.0;
  static const buttonHeight = 50.0;
  final borderRadius = BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textButtonColor, fontSize: fontSize),
        ),
      ),
    );
  }
}
