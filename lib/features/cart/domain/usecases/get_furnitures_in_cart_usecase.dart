import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/cart.dart';
import '../repository/cart_repository.dart';
import 'package:meta/meta.dart';

class GetFurnituresInCartUseCase extends UseCase<Cart, NoParams> {
  GetFurnituresInCartUseCase({@required this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, Cart>> call(NoParams params) async {
    return await repository.getFurnituresInCart();
  }
}
