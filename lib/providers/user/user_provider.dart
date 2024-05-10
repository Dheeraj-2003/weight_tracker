import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/respositories/users/user_repo_provider.dart';
import 'package:weight_tracker/providers/user/user_notifier.dart';
import 'package:weight_tracker/providers/user/user_state.dart';

final StateNotifierProvider<UserNotifier, UserState> userProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserNotifier(userRepository);
});
