import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';
import 'package:weight_tracker/presentation/screens/signup_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("users");
  await Hive.openBox("db");
  final box = Hive.box("users");
  final currentUser = box.get("currentUser") as String?;
  log(currentUser ?? "no user found");
  bool loggedIn = false;
  if (currentUser != null) {
    loggedIn = true;
    await Hive.openBox(currentUser);
  }

  runApp(ProviderScope(
      child: MyApp(
    loggedIn: loggedIn,
  )));
}

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
