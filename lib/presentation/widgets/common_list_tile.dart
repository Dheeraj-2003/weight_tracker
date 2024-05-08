import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile({required this.title, this.subTitle, super.key});

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subTitle != null ? Text(subTitle!) : null,
    );
  }
}
