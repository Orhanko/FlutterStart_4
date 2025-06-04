import 'package:flutter/material.dart';

class MealMetadata extends StatelessWidget {
  const MealMetadata({required this.icon, required this.label, super.key});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
