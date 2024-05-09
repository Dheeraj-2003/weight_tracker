import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/widgets/date_picker.dart';

class WeightForm extends StatefulWidget {
  const WeightForm({super.key});

  @override
  State<WeightForm> createState() => _WeightFormState();
}

class _WeightFormState extends State<WeightForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();

  void _onSave() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Add Weight",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.notes_rounded),
                  border: InputBorder.none,
                  labelText: "Weight"),
            ),
            const SizedBox(height: 28),
            const DatePicker(),
            const SizedBox(height: 28),
            ElevatedButton(onPressed: _onSave, child: const Text("Save")),
          ],
        ));
  }
}
