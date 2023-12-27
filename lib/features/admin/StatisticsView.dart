import 'package:carrental/features/admin/methods/customPiechartsection.dart';
import 'package:carrental/features/admin/widgets/rowColorWidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView(
      {super.key,
      required this.names,
      required this.counts,
      required this.text});
  final String text;
  final List<String> names;
  final List<num> counts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(fontSize: 30),
                ),
                PieChart(
                  swapAnimationDuration: const Duration(milliseconds: 60),
                  PieChartData(
                    sections: [
                      customPieChartSectionData(
                          value: counts[0].toDouble(), color: Colors.red),
                      customPieChartSectionData(
                          value: counts[0].toDouble(), color: Colors.green),
                      customPieChartSectionData(
                          value: counts[0].toDouble(), color: Colors.orange),
                      customPieChartSectionData(
                          value: counts[0].toDouble(), color: Colors.purple),
                      customPieChartSectionData(
                          value: counts[0].toDouble(), color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          RowColor(text: names[0], color: Colors.red),
          RowColor(text: names[0], color: Colors.green),
          RowColor(text: names[0], color: Colors.orange),
          RowColor(text: names[0], color: Colors.purple),
          RowColor(text: names[0], color: Colors.grey),
        ],
      ),
    );
  }
}
