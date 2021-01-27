import '../../domain/entity/cart.dart';
import '../../../furniture/data/models/furniture_model.dart';

abstract class CartLocalDataSource {
  Future<Cart> getFurnituresInCart();

  Future<List<FurnitureModel>> getAllFurniture();

  Future<void> addToCart(int id);

  Future<void> removeFromCart(int id);
}
