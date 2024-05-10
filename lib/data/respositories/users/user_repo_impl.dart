import 'package:weight_tracker/data/datasources/users/local/users_databsource.dart';
import 'package:weight_tracker/data/models/user.dart';
import 'package:weight_tracker/data/respositories/users/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersDatasource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<void> addUser(User user) async {
    try {
      await dataSource.adduser(user);
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<void> setCurrentUser(User user) async {
    try {
      await dataSource.setCurrentUser(user);
    } catch (e) {
      throw "$e";
    }
  }
}
