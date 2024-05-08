import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/widgets/weight_form.dart';

class AddWeightScreen extends StatelessWidget {
  const AddWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const WeightForm(),
    );
  }
}
