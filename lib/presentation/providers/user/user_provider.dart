import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/presentation/providers/user/user_notifier.dart';
import 'package:weight_tracker/presentation/providers/user/user_state.dart';

final StateNotifierProvider<UserNotifier, UserState> userProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier());
