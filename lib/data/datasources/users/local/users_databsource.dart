import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/data/models/user.dart';

class UsersDatasource {
  static const box = "users";
  final db = Hive.box(box);

  Future<void> adduser(User user) async {
    const usersBox = "allUsers";
    final userData = await db.get(usersBox) as List;
    userData.add(user.toMap());

    await db.put(usersBox, userData);
    log(userData.toString());
  }

  Future<void> setCurrentUser(User user) async {
    const usersBox = "currentUser";
    await db.put(usersBox, user.name);
  }
}
