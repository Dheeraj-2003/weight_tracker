import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/providers/chart/chart_provider.dart';

class MonthsDialog extends ConsumerStatefulWidget {
  const MonthsDialog({super.key});

  @override
  ConsumerState<MonthsDialog> createState() => _MonthsDialogState();
}

class _MonthsDialogState extends ConsumerState<MonthsDialog> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Set number of months to analyze',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      content: TextField(
        controller: textController,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          suffix: Text("Months"),
          hintText: "1 <= (No. of months) < 12",
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (textController.text.isNotEmpty &&
                int.parse(textController.text) < 12 &&
                int.parse(textController.text) >= 1) {
              ref
                  .watch(chartProvider.notifier)
                  .setMonthsCount(int.parse(textController.text));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Set'),
        ),
      ],
    );
  }
}
