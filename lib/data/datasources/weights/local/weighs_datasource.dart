import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/data/models/weight.dart';

class WeightsDatasource {
  static const box = "db";
  final db = Hive.box(box);

  Future<void> addWeight(Weight weight) async {
    await db.add(weight.toMap());
  }

  Future<List<Weight>> getWeights() async {
    final List<Weight> weights = [];

    for (var i = 0; i < db.length; i++) {
      final weightMap = await db.getAt(i);
      final weight = Weight.fromMap(weightMap);
      weights.add(weight);
    }
    return Future(() => weights);
  }
}
