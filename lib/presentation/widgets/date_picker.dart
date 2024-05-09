import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class DatePicker extends StatefulWidget {
  const DatePicker({required this.onSelect, super.key});

  final void Function(DateTime time) onSelect;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate = DateTime.now();

  void _datePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
      }
    });
    widget.onSelect(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _datePicker,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0))),
        padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
        height: 65,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.calendar_month,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                formatter.format(_selectedDate),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
