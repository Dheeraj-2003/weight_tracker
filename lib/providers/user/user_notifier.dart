import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/data/models/user.dart';
import 'package:weight_tracker/data/respositories/users/user_repository.dart';
import 'package:weight_tracker/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this.userRepository) : super(InitialUserState()) {
    getUser();
  }

  User? currentUser;
  List<User> users = [];

  final UserRepository userRepository;

  Future<void> addUser(User user) async {
    try {
      state = LoggingIn();
      await setCurrentUser(user);
      await userRepository.addUser(user);
      currentUser = user;
      users;
      state = LoggedIn(user: user, users: users);
    } catch (e) {
      log("add user: $e");
    }
  }

  Future<void> getUser() async {
    User user = await userRepository.getUser();
    users = await userRepository.getUsers();
    setCurrentUser(user);
  }

  Future<void> setCurrentUser(User user) async {
    try {
      state = LoggingIn();
      userRepository.setCurrentUser(user);
      currentUser = user;
      users = await userRepository.getUsers();
      await Hive.openBox(user.name);
      log("current user: ${currentUser.toString()}");
      state = LoggedIn(user: user, users: users);
    } catch (e) {
      log("set user: $e");
    }
  }
}
