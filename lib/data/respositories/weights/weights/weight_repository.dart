import 'package:weight_tracker/data/models/weight.dart';

abstract class WeightRepository {
  Future<void> addWeight(Weight weight);
  Future<List<Weight>> getWeights();
}
