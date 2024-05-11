import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/data/respositories/weights/weights/weight_repository.dart';
import 'package:weight_tracker/providers/weights/weights_state.dart';

class WeightsNotifier extends StateNotifier<WeightsState> {
  WeightsNotifier(this.weightRepository) : super(InitialWeightsState()) {
    getWeights();
  }

  List<Weight> weightList = [];

  final WeightRepository weightRepository;

  Future<void> addWeight(Weight weight) async {
    try {
      state = WeightsLoadingState();
      await weightRepository.addWeight(weight);
      getWeights();
    } catch (e) {
      log("add weights: $e");
    }
  }

  Future<void> deleteWeight(Weight weight) async {
    try {
      state = WeightsLoadingState();
      await weightRepository.deleteWeight(weight);
      getWeights();
    } catch (e) {
      log("add weights: $e");
    }
  }

  Future<void> update(Weight currentWeight, Weight weight) async {
    try {
      state = WeightsLoadingState();
      await weightRepository.updateWeight(currentWeight, weight);
      getWeights();
    } catch (e) {
      log("add weights: $e");
    }
  }

  Future<void> getWeights() async {
    try {
      weightList = await weightRepository.getWeights();
      weightList.sort((b, a) => a.time.compareTo(b.time));
      state = WeightsLoadedState(weights: weightList);
    } catch (e) {
      log("get weights: $e");
    }
  }
}
