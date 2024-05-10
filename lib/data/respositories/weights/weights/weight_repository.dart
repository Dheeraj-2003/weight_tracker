import 'package:weight_tracker/data/models/weight.dart';

abstract class WeightRepository {
  Future<void> addWeight(Weight weight);
  Future<void> deleteWeight(Weight weight);
  Future<void> updateWeight(Weight currWeight, Weight weight);
  Future<List<Weight>> getWeights();
}
