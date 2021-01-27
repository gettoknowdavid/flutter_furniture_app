import 'cart_local_data_source.dart';
import '../../domain/entity/cart.dart';
import '../../../furniture/data/models/furniture_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

class CartLocalDataSourceImplementation implements CartLocalDataSource {
  CartLocalDataSourceImplementation({
    @required this.database,
    @required this.cartStore,
    @required this.furnitureStore,
  });

  Database database;
  StoreRef<int, Map<String, dynamic>> cartStore;
  StoreRef<int, Map<String, dynamic>> furnitureStore;

  @override
  Future<void> addToCart(int id) async {
    final _allFurniture = await getAllFurniture();
    final _furniture = _allFurniture.firstWhere((e) => e.id == id);

    await cartStore.add(database, _furniture.toJson());
  }

  @override
  Future<Cart> getFurnituresInCart() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final records = await cartStore.find(database, finder: finder);

    final _furnitures = records
        .map((e) => FurnitureModel.fromJson(e.value))
        .toList(growable: false);

    final Map<int, int> _furnitureMap = Map.fromIterable(
      _furnitures,
      key: (v) => v.id,
      value: (v) => _furnitures.where((e) => e.id == v.id).toList().length,
    );

    return Cart(furnitures: _furnitures, furnitureMap: _furnitureMap);
  }

  @override
  Future<void> removeFromCart(int id) async {
    final finder = Finder(filter: Filter.equals('id', id));
    final _record = await cartStore.findFirst(database, finder: finder);

    final _key = _record.key;

    await cartStore.record(_key).delete(database);
  }

  @override
  Future<List<FurnitureModel>> getAllFurniture() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final records = await furnitureStore.find(database, finder: finder);

    return records
        .map((e) => FurnitureModel.fromJson(e.value))
        .toList(growable: false);
  }
}
