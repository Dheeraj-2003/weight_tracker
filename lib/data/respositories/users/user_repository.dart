import 'package:weight_tracker/data/models/user.dart';

abstract class UserRepository {
  Future<void> addUser(User user);
  Future<void> setCurrentUser(User user);
  Future<User> getUser();
  Future<List<User>> getUsers();
}
