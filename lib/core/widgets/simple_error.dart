import 'package:flutter/material.dart';

class SimpleError extends StatelessWidget {
  final String message;
  final double height;

  const SimpleError({
    super.key,
    required this.message,
    this.height = 256.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(child: Text(message)),
    );
  }
}
