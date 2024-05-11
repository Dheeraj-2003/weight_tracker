// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/providers/user/user_notifier.dart';

class WeightsDatasource {
  final UserNotifier userNotifier;
  WeightsDatasource({
    required this.userNotifier,
  });

  Future<void> addWeight(Weight weight) async {
    final box = userNotifier.currentUser?.name ?? "db";
    final db = Hive.box(box);
    await db.add(weight.toMap());
  }

  Future<void> deleteWeight(Weight weight) async {
    final box = userNotifier.currentUser?.name ?? "db";
    final db = Hive.box(box);
    final index = db.values
        .toList()
        .indexWhere((entry) => Weight.fromMap(entry) == weight);

    if (index != -1) {
      await db.deleteAt(index);
    }
  }

  Future<void> updateWeight(Weight currWeight, Weight weight) async {
    final box = userNotifier.currentUser?.name ?? "db";
    final db = Hive.box(box);
    final index = db.values
        .toList()
        .indexWhere((entry) => Weight.fromMap(entry) == currWeight);

    if (index != -1) {
      await db.putAt(index, weight.toMap());
    }
  }

  Future<List<Weight>> getWeights() async {
    final box = userNotifier.currentUser?.name ?? "db";
    final db = Hive.box(box);
    final List<Weight> weights = [];

    for (var i = 0; i < db.length; i++) {
      final weightMap = await db.getAt(i);
      final weight = Weight.fromMap(weightMap);
      weights.add(weight);
    }
    return Future(() => weights);
  }
}
