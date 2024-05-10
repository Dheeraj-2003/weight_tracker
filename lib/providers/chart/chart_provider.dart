import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/providers/chart/chart_notifier.dart';
import 'package:weight_tracker/providers/chart/chart_state.dart';

final StateNotifierProvider<ChartNotifier, ChartState> chartProvider =
    StateNotifierProvider<ChartNotifier, ChartState>((ref) {
  return ChartNotifier();
});
