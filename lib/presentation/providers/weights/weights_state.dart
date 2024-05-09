import 'package:flutter/material.dart';
import 'package:weight_tracker/data/models/weight.dart';

@immutable
abstract class WeightsState {}

class InitialWeightsState extends WeightsState {}

class WeightsLoadingState extends WeightsState {}

class WeightsLoadedState extends WeightsState {
  WeightsLoadedState({
    required this.weights,
  });
  final List<Weight> weights;
}

class ErrorWeightsState extends WeightsState {
  ErrorWeightsState({
    required this.errorMessage,
  });
  final String errorMessage;
}
