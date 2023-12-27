import 'package:flutter/material.dart';

class RowColor extends StatelessWidget {
  const RowColor({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 145),
            CircleAvatar(
              backgroundColor: color,
              radius: 12,
            ),
            const SizedBox(width: 24),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
