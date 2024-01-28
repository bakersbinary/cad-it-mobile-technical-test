import 'package:flutter/material.dart';

class FillButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double borderRadius;
  final double textSize;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const FillButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.textSize = 16.0,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
