import 'furniture_local_data_source.dart';
import '../models/furniture_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

class FurnitureLocalDataSourceImplementation
    implements FurnitureLocalDataSource {
  FurnitureLocalDataSourceImplementation({
    @required this.database,
    @required this.store,
  });

  Database database;
  StoreRef<int, Map<String, dynamic>> store;

  @override
  Future<List<FurnitureModel>> getAllFurniture() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);

    final records = await store.find(database, finder: finder);

    return records
        .map((e) => FurnitureModel.fromJson(e.value))
        .toList(growable: false);
  }

  @override
  Future<void> storeAllFurniture(List<FurnitureModel> allFurniture) async {
    await store.drop(database);

    int key = 0;

    return await store.addAll(
      database,
      allFurniture.map((e) => e.copyWith(id: key++).toJson()).toList(),
    );
  }
}
