import 'package:flutter/material.dart';

@immutable
abstract class ChartState {}

class InitialChartState extends ChartState {}

class SettingMonthsState extends ChartState {}

class FinalMonthsState extends ChartState {
  final int months;

  FinalMonthsState({required this.months});
}
