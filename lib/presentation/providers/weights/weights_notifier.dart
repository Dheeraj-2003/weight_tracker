import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/presentation/providers/weights/weights_state.dart';

class WeightsNotifier extends StateNotifier<WeightsState> {
  WeightsNotifier() : super(InitialWeightsState());

}
