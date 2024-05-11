import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/providers/weights/weights_provider.dart';
import 'package:weight_tracker/presentation/widgets/date_picker.dart';

class WeightForm extends ConsumerStatefulWidget {
  const WeightForm({this.currentWeight, super.key});

  final Weight? currentWeight;

  @override
  ConsumerState<WeightForm> createState() {
    return _WeightFormState();
  }
}

class _WeightFormState extends ConsumerState<WeightForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.currentWeight != null) {
        _weightController.text = widget.currentWeight!.weight.toString();
        _selectedTime = widget.currentWeight!.time;
      }
    });
    super.initState();
  }

  void _onAdd() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    ref.watch(weightsProvider.notifier).addWeight(Weight(
        time: _selectedTime, weight: double.parse(_weightController.text)));
    Navigator.of(context).pop();
  }

  void _onUpdate() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final currWeight = widget.currentWeight!;
    ref.watch(weightsProvider.notifier).update(
        currWeight,
        Weight(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "${widget.currentWeight == null ? "Add" : "Edit"} Weight Entry",
                    style: const TextStyle(fontSize: 16),
                  ),
                  widget.currentWeight != null
                      ? IconButton(
                          onPressed: () {
                            ref
                                .watch(weightsProvider.notifier)
                                .deleteWeight(widget.currentWeight!);
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.delete_outline_rounded))
                      : const SizedBox(
                          width: 30,
                        ),
                ],
              ),
              const SizedBox(height: 26),
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      double.parse(value.trim()) <= 0) {
                    return "Please enter your weight (Kg)";
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
              widget.currentWeight == null
                  ? DatePicker(
                      onSelect: _selectDate,
                    )
                  : DatePicker(
                      onSelect: _selectDate,
                      date: widget.currentWeight!.time,
                    ),
              const SizedBox(height: 22),
              ElevatedButton(
                  onPressed: () {
                    if (widget.currentWeight == null) {
                      _onAdd();
                    } else {
                      _onUpdate();
                    }
                  },
                  child: const Text("Save")),
            ],
          ),
        ));
  }
}
