import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';
import 'package:weight_tracker/presentation/screens/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.loggedIn});

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loggedIn ? const HomeScreen() : const SignUpScreen(),
    );
  }
}
