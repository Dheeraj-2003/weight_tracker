import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/datasources/local/weighs_datasource.dart';

final weightDataSourceProvider = Provider<WeightsDatasource>((ref) {
  return WeightsDatasource();
});
