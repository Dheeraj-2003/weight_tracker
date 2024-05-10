import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/datasources/users/local/users_databsource.dart';

final userDataSourceProvider = Provider<UsersDatasource>((ref) {
  return UsersDatasource();
});
