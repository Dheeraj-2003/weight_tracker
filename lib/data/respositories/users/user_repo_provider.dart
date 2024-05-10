import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/datasources/users/local/user_datasource_provider.dart';
import 'package:weight_tracker/data/respositories/users/user_repo_impl.dart';
import 'package:weight_tracker/data/respositories/users/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = ref.read(userDataSourceProvider);
  return UserRepositoryImpl(dataSource);
});
