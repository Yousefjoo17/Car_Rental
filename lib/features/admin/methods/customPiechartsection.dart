import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

PieChartSectionData customPieChartSectionData(
    {required double value, required Color color}) {
  return PieChartSectionData(
    title: value.toInt().toString(),
    titleStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    radius: 70,
    value: value,
    color: color,
  );
}
