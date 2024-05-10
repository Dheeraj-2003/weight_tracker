import 'package:flutter/material.dart';

@immutable
abstract class UserState {}

class InitialUserState extends UserState {}

class LoggedIn extends UserState {}

class LoggingIn extends UserState {}
