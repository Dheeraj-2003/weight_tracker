import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/widgets/profile_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Welcome !",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text("Enter Username to continue"),
            SizedBox(height: 50),
            ProfileForm(),
          ],
        ),
      ),
    );
  }
}
