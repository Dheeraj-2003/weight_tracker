import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  void _onEnter() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
