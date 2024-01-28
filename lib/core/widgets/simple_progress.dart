import 'package:flutter/material.dart';

class SimpleProgress extends StatelessWidget {
  final double height;
  final EdgeInsets margin;

  const SimpleProgress({
    super.key,
    required this.height,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(16.0),
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
