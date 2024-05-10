import 'package:flutter/material.dart';
import 'package:weight_tracker/data/models/user.dart';

@immutable
abstract class UserState {}

class InitialUserState extends UserState {}

class LoggedIn extends UserState {
  final User user;
  final List<User> users;

  LoggedIn({required this.user, required this.users});
}

class LoggingIn extends UserState {}
