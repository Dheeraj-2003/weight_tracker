import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/datasources/weights/local/weighs_datasource.dart';
import 'package:weight_tracker/providers/user/user_notifier.dart';
import 'package:weight_tracker/providers/user/user_provider.dart';

final weightDataSourceProvider = Provider<WeightsDatasource>((ref) {
  final UserNotifier userNotifier = ref.watch(userProvider.notifier);
  return WeightsDatasource(userNotifier: userNotifier);
});
