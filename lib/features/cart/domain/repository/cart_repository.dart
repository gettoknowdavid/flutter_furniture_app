import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/cart.dart';
import '../../../furniture/domain/entity/furniture.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getFurnituresInCart();

  Future<Either<Failure, Furniture>> addToCart(int id);

  Future<Either<Failure, Furniture>> removeFromCart(int id);
}
