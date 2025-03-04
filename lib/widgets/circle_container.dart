import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key, this.child, required this.color});
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(width: 2, color: color)),
        child: Center(child: child ?? const SizedBox.shrink()));
  }
}
