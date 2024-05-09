import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/datasources/local/weights_datasource_provider.dart';
import 'package:weight_tracker/data/respositories/weights/weight_repository.dart';
import 'package:weight_tracker/data/respositories/weights/weight_repository_impl.dart';

final weightRepositoryProvider = Provider<WeightRepository>((ref) {
  final dataSource = ref.read(weightDataSourceProvider);
  return WeightRepositoryImpl(dataSource);
});
