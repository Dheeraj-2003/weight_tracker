import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/data/respositories/weights/weight_repository.dart';
import 'package:weight_tracker/presentation/providers/weights/weights_state.dart';

class WeightsNotifier extends StateNotifier<WeightsState> {
  WeightsNotifier(this.weightRepository) : super(InitialWeightsState()) {
    getWeights();
  }

  List<Weight> weightList = [];

  final WeightRepository weightRepository;

  void addWeight(Weight weight) async {
    try {
      state = WeightsLoadingState();
      await weightRepository.addWeight(weight);
      getWeights();
    } catch (e) {
      log("$e");
    }
  }

  void getWeights() async {
    try {
      weightList = await weightRepository.getWeights();
      state = WeightsLoadedState(weights: weightList);
    } catch (e) {
      log("$e");
    }
  }
}
