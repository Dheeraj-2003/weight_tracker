import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("users");
  await Hive.openBox("db");

  final box = Hive.box("users");
  final currentUser = box.get("currentUser") as String?;

  bool loggedIn = false;
  if (currentUser != null) {
    loggedIn = true;
    await Hive.openBox(currentUser);
  }

  runApp(
    ProviderScope(
      child: MyApp(
        loggedIn: loggedIn,
      ),
    ),
  );
}
