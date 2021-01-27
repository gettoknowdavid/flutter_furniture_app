import '../datasources/cart_local_data_source.dart';
import '../../domain/entity/cart.dart';
import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/cart_repository.dart';
import '../../../furniture/domain/entity/furniture.dart';
import 'package:meta/meta.dart';

class CartRepositoryImplementation implements CartRepository {
  CartRepositoryImplementation({@required this.localDataSource});

  final CartLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Furniture>> addToCart(int id) async {
    await localDataSource.addToCart(id);

    final _furnitures = await localDataSource.getAllFurniture();

    final _furniture = _furnitures.firstWhere((e) => e.id == id);

    return Right(_furniture);
  }

  @override
  Future<Either<Failure, Cart>> getFurnituresInCart() async {
    final result = await localDataSource.getFurnituresInCart();

    return Right(result);
  }

  @override
  Future<Either<Failure, Furniture>> removeFromCart(int id) async {
    await localDataSource.removeFromCart(id);

    final _furnitures = await localDataSource.getAllFurniture();

    final _furniture = _furnitures.firstWhere((e) => e.id == id);

    return Right(_furniture);
  }
}
