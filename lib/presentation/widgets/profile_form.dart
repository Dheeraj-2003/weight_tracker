import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/user.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';
import 'package:weight_tracker/providers/user/user_provider.dart';

class ProfileForm extends ConsumerStatefulWidget {
  const ProfileForm({super.key});

  @override
  ConsumerState<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onEnter() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await ref
          .watch(userProvider.notifier)
          .addUser(User(name: _nameController.text));
    } catch (e) {
      log("$e");
    }
    Navigator.of(context).popUntil((route) => false);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Your name is requied";
                } else if (value.length > 30) {
                  return "Username can't be lengthier than 30 characters";
                }
                return null;
              },
              controller: _nameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.notes_rounded),
                  border: InputBorder.none,
                  labelText: "Username"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  _onEnter();
                },
                child: const Text("Enter"))
          ],
        ));
  }
}
