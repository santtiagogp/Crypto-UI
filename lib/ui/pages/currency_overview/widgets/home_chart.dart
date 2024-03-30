import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../foundation/app_theme.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          border: const Border.fromBorderSide(
            BorderSide.none
          )
        ),
        gridData: const FlGridData(
          drawVerticalLine: false,
        ),

        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitleWidgets
            )
          )
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            curveSmoothness: 0.01,
            color: CryptoTheme.primaryColor,
            barWidth: 1.5,
            dotData: const FlDotData(show: false),                      
            spots: List.generate(
              80,
              (index) => FlSpot(
                index.toDouble(), Random().nextInt(10).toDouble())
              )
          )
        ]
      )
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 15,
    );

    switch (value.toInt()) {
      case 10:
        return const Text('M', style: style);
      case 20:
        return const Text('T', style: style);
      case 30:
        return const Text('W', style: style);
      case 40:
        return const Text('T', style: style);
      case 50:
        return const Text('F', style: style);
      case 60:
        return const Text('S', style: style);
      case 70:
        return const Text('S', style: style);
      default:
        return const Text('');
    }
  }

}