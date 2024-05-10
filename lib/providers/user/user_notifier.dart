import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/user.dart';
import 'package:weight_tracker/data/respositories/users/user_repository.dart';
import 'package:weight_tracker/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this.userRepository) : super(InitialUserState());

  User? currentUser;

  final UserRepository userRepository;

  void addUser(User user) {
    try {
      state = LoggingIn();
      userRepository.addUser(user);
      currentUser = user;
      setCurrentUser(user);
      state = LoggedIn();
    } catch (e) {
      log("add user: $e");
    }
  }

  void setCurrentUser(User user) {
    try {
      state = LoggingIn();
      userRepository.setCurrentUser(user);
      state = LoggedIn();
    } catch (e) {
      log("set user: $e");
    }
  }
}
