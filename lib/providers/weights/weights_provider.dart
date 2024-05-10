import 'package:weight_tracker/data/respositories/weights/weights/weight_repository_provider.dart';
import 'package:weight_tracker/providers/weights/weights_notifier.dart';
import 'package:weight_tracker/providers/weights/weights_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<WeightsNotifier, WeightsState> weightsProvider =
    StateNotifierProvider<WeightsNotifier, WeightsState>((ref) {
  final weightRepository = ref.watch(weightRepositoryProvider);
  return WeightsNotifier(weightRepository);
});
