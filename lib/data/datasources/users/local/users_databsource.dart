import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/data/models/user.dart';

class UsersDatasource {
  static const box = "users";
  final db = Hive.box(box);

  Future<void> adduser(User user) async {
    const usersBox = "allUsers";
    final data = await db.get(usersBox) as List?;
    final userData = data ?? [];
    if (data == null) {
      userData.add(user.toMap());
    }
    bool found = false;
    for (var i = 0; i < userData.length; i++) {
      final userMap = userData[i];
      final user1 = User.fromMap(userMap);
      if (user1 == user) found = true;
    }
    if (!found) userData.add(user.toMap());
    setCurrentUser(user);
    await db.put(usersBox, userData);
  }

  Future<User> getUser() async {
    final username = await db.get("currentUser") as String;
    return Future(() => User(name: username));
  }

  Future<List<User>> getUsers() async {
    const usersBox = "allUsers";
    final allUsers = await db.get(usersBox) as List?;
    final List<User> users = [];
    if (allUsers == null) return Future(() => users);
    for (var i = 0; i < allUsers.length; i++) {
      final userMap = allUsers[i];
      final user1 = User.fromMap(userMap);
      users.add(user1);
    }
    log(users.toString());
    return Future(() => users);
  }

  Future<void> setCurrentUser(User user) async {
    const usersBox = "currentUser";
    await db.put(usersBox, user.name);
  }
}
