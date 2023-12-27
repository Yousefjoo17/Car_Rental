import 'package:carrental/features/admin/methods/customPiechartsection.dart';
import 'package:carrental/features/admin/widgets/rowColorWidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RequiredBrandView extends StatelessWidget {
  const RequiredBrandView({super.key});

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
                const Text(
                  'Modals',
                  style: TextStyle(fontSize: 30),
                ),
                PieChart(
                  swapAnimationDuration: const Duration(milliseconds: 60),
                  PieChartData(
                    sections: [
                      customPieChartSectionData(value: 16, color: Colors.red),
                      customPieChartSectionData(value: 12, color: Colors.green),
                      customPieChartSectionData(
                          value: 60, color: Colors.orange),
                      customPieChartSectionData(
                          value: 20, color: Colors.purple),
                      customPieChartSectionData(value: 36, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const RowColor(text: 'Audi', color: Colors.red),
          const RowColor(text: 'BMW', color: Colors.green),
          const RowColor(text: 'AU', color: Colors.orange),
          const RowColor(text: 'Toy', color: Colors.purple),
          const RowColor(text: 'Joj', color: Colors.grey),
        ],
      ),
    );
  }
}