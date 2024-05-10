import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/providers/weights/weights_provider.dart';
import 'package:weight_tracker/presentation/widgets/date_picker.dart';

class WeightForm extends ConsumerStatefulWidget {
  const WeightForm({super.key});

  @override
  ConsumerState<WeightForm> createState() {
    return _WeightFormState();
  }
}

class _WeightFormState extends ConsumerState<WeightForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    ref.watch(weightsProvider.notifier).addWeight(Weight(
        time: _selectedTime, weight: double.parse(_weightController.text)));
    Navigator.of(context).pop();
  }

  void _selectDate(DateTime time) {
    _selectedTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Add Weight",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 26),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Your weight is requied";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: _weightController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.notes_rounded),
                  border: InputBorder.none,
                  labelText: "Weight",
                  suffix: Text("Kg"),
                ),
              ),
              const SizedBox(height: 10),
              DatePicker(
                onSelect: _selectDate,
              ),
              const SizedBox(height: 22),
              ElevatedButton(onPressed: _onSave, child: const Text("Save")),
            ],
          ),
        ));
  }
}
