import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class CommonListTile extends StatelessWidget {
  const CommonListTile(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: const Icon(Icons.circle_rounded),
      title: Text("$title Kg"),
      trailing: Text(
        subTitle,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
