import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hack_motion_project/config/theme/colors.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';
import 'package:hack_motion_project/presentation/widgets/linegraph/swing_analyzer.dart';

// currently this widget is made specificaly for showcasing flexionExtension & ulnarRadial
// but if there was more in the future this could easily be refactored to take in as many as needed.

class SwingLineChart extends StatelessWidget {
  final SwingModel swing;

  const SwingLineChart({super.key, required this.swing});

  @override
  Widget build(BuildContext context) {
    final feData = swing.flexionExtension;
    final urData = swing.ulnarRadial;

    // Calculate max/min values and indexes
    final feMax = feData.reduce((a, b) => a > b ? a : b);
    final feMin = feData.reduce((a, b) => a < b ? a : b);
    final feMaxIndex = feData.indexOf(feMax);
    final feMinIndex = feData.indexOf(feMin);

    final urMax = urData.reduce((a, b) => a > b ? a : b);
    final urMin = urData.reduce((a, b) => a < b ? a : b);
    final urMaxIndex = urData.indexOf(urMax);
    final urMinIndex = urData.indexOf(urMin);

    final analysisResult = SwingAnalyzer.analyze(
      feMin: feMin,
      feMax: feMax,
      urMin: urMin,
      urMax: urMax,
    );

    //
    //
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text("Swing Graph", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),

        // Caption
        Row(
          children: [
            _buildLegendBox(AppColors.teal),
            const SizedBox(width: 4),
            const Text("Flexion / Extension"),
            const SizedBox(width: 16),
            _buildLegendBox(AppColors.orange),
            const SizedBox(width: 4),
            const Text("Ulnar / Radial"),
          ],
        ),

        const SizedBox(height: 32),

        // Chart
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: -60,
              maxY: 60,
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(fontSize: 12),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                horizontalInterval: 20,
                drawVerticalLine: false,
                getDrawingHorizontalLine:
                    (value) => FlLine(
                      color: Colors.grey.withValues(alpha: 0.3),
                      strokeWidth: 1,
                    ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    feData.length,
                    (index) => FlSpot(index.toDouble(), feData[index]),
                  ),
                  isCurved: true,
                  barWidth: 4,
                  color: AppColors.teal,
                  dotData: FlDotData(
                    checkToShowDot: (FlSpot spot, LineChartBarData barData) {
                      final index = spot.x.toInt();
                      return index == feMaxIndex || index == feMinIndex;
                    },
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: barData.color ?? AppColors.teal,
                        strokeWidth: 2,
                        strokeColor: AppColors.darkTeal,
                      );
                    },
                  ),
                ),
                LineChartBarData(
                  spots: List.generate(
                    urData.length,
                    (index) => FlSpot(index.toDouble(), urData[index]),
                  ),
                  isCurved: true,
                  barWidth: 4,
                  color: AppColors.orange,
                  dotData: FlDotData(
                    checkToShowDot: (FlSpot spot, LineChartBarData barData) {
                      final index = spot.x.toInt();
                      return index == urMaxIndex || index == urMinIndex;
                    },
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: barData.color ?? AppColors.orange,
                        strokeWidth: 2,
                        strokeColor: AppColors.darkOrange,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 24),

        // Analysis
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            analysisResult.summary,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: analysisResult.isGood ? AppColors.darkTeal : AppColors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegendBox(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
