import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(
          drawVerticalLine: false,
        ),
        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
        titlesData: const FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(
            color: Colors.lightGreen[700],
            barWidth: 1.5,
            dotData: const FlDotData(show: false),                      
            spots: List.generate(
              30,
              (index) => FlSpot(index.toDouble(), Random().nextDouble())
            )
          )
        ]
      )
    );
  }
}