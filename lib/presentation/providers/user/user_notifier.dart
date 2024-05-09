import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/presentation/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(InitialUserState());

  

}
