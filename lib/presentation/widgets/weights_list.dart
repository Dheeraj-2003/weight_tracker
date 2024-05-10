import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/providers/weights/weights_provider.dart';
import 'package:weight_tracker/providers/weights/weights_state.dart';
import 'package:weight_tracker/presentation/widgets/common_list_tile.dart';

class WeightsList extends StatefulWidget {
  const WeightsList({super.key});

  @override
  State<WeightsList> createState() => _WeightsListState();
}

class _WeightsListState extends State<WeightsList> {
  List<Weight> weightsList = [];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(weightsProvider);
      if (state is InitialWeightsState) {
        return const Center(
            heightFactor: 15, child: CircularProgressIndicator());
      } else if (state is WeightsLoadingState) {
        return const Center(
            heightFactor: 15, child: CircularProgressIndicator());
      } else if (state is WeightsLoadedState) {
        weightsList = state.weights;
        if (weightsList.isEmpty) {
          return const Center(
            child: Center(
                heightFactor: 15,
                child: Text("Your recent weights will be shown here")),
          );
        }
        return ListView.builder(
            itemCount: weightsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => CommonListTile(
                  title: weightsList[index].weight.toString(),
                  subTitle: formatter.format(weightsList[index].time),
                ));
      } else if (state is ErrorWeightsState) {
        return Center(heightFactor: 15, child: Text(state.errorMessage));
      }
      return const Center(heightFactor: 15, child: Text("Nothing found"));
    });
  }
}
