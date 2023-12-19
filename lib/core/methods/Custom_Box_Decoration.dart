import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration(List<Color> myColors) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: myColors,
      stops: const [0.4, 0.65, 0.9],
    ),
  );
}
