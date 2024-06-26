import 'package:weight_tracker/data/datasources/weights/local/weighs_datasource.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/data/respositories/weights/weights/weight_repository.dart';

class WeightRepositoryImpl implements WeightRepository {
  final WeightsDatasource dataSource;

  WeightRepositoryImpl(this.dataSource);

  @override
  Future<void> addWeight(Weight weight) async {
    try {
      await dataSource.addWeight(weight);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Weight>> getWeights() async {
    try {
      return await dataSource.getWeights();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteWeight(Weight weight) async {
    try {
      await dataSource.deleteWeight(weight);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateWeight(Weight currentWeight, Weight weight) async {
    try {
      await dataSource.updateWeight(currentWeight, weight);
    } catch (e) {
      throw '$e';
    }
  }
}
