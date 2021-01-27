import '../models/furniture_model.dart';

abstract class FurnitureLocalDataSource {
  Future<List<FurnitureModel>> getAllFurniture();

  Future<void> storeAllFurniture(List<FurnitureModel> allFurniture);
}
