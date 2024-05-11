import 'package:flutter/material.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/presentation/screens/add_weight_screen.dart';
import 'package:weight_tracker/utils/datetime_utils.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile({required this.weight, super.key});

  final Weight weight;

  void _openWeightForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddWeightScreen(weight: weight);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _openWeightForm(context);
      },
      contentPadding: const EdgeInsets.all(8),
      leading: const Icon(Icons.circle_rounded),
      title: Text("${weight.weight} Kg"),
      subtitle: Text(
        DateTimeUtils().dateFormatter(weight.time),
        style: const TextStyle(fontSize: 15),
      ),
      trailing: const Icon(Icons.edit_outlined),
    );
  }
}
