import 'package:flutter/material.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/presentation/widgets/weight_form.dart';

class AddWeightScreen extends StatelessWidget {
  const AddWeightScreen({this.weight, super.key});

  final Weight? weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: weight == null
          ? const WeightForm()
          : WeightForm(
              currentWeight: weight,
            ),
    );
  }
}
