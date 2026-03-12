import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/savings_screen/widgets/savings_chart_painter.dart';


class SavingsChart extends StatelessWidget {
  final List<double> chartData;
  final int peakIndex;
  final int? touchedIndex;
  final Function(Offset, double) onTapDown;
  final VoidCallback onTapUp;

  const SavingsChart({
    super.key,
    required this.chartData,
    required this.peakIndex,
    required this.touchedIndex,
    required this.onTapDown,
    required this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTapDown: (details) => onTapDown(details.localPosition, screenWidth),
      onTapUp: (_) => onTapUp(),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: CustomPaint(
          painter: SavingsChartPainter(
            data: chartData,
            peakIndex: peakIndex,
            touchedIndex: touchedIndex,
          ),
        ),
      ),
    );
  }
}
