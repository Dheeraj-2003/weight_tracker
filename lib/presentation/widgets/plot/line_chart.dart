import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/providers/weights/weights_provider.dart';
import 'package:weight_tracker/providers/weights/weights_state.dart';

final List<String> months = ["Jan", "Feb", "Mar", "Apr", "Jun", "Jul"];

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(weightsProvider);
      List<Weight> weighList = state is WeightsLoadedState ? state.weights : [];
      final List<FlSpot> dummyData1 = List.generate(weighList.length, (index) {
        return FlSpot(
            weighList[index].time.month.toDouble(), weighList[index].weight);
      });
      return weighList.isEmpty
          ? const Center(
              child: Text("Add weights to analyze"),
            )
          : Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: true,
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(
                      axisNameWidget: Text("Weight (Kg)"),
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 38),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: const Text("Time (Months)"),
                      sideTitles: SideTitles(
                        interval: 1,
                        reservedSize: 28,
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text(
                          months[value.toInt()],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: dummyData1,
                      barWidth: 3,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
