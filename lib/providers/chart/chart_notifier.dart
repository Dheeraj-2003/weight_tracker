import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/providers/chart/chart_state.dart';

class ChartNotifier extends StateNotifier<ChartState> {
  ChartNotifier() : super(InitialChartState());

  int months = 6;

  void setMonthsCount(int n) {
    state = SettingMonthsState();
    months = n;
    state = FinalMonthsState(months: months);
  }
}
