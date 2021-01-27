import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/cart_repository.dart';
import '../../../furniture/domain/entity/furniture.dart';
import 'package:meta/meta.dart';

class RemoveFromCartUseCase extends UseCase<Furniture, Params> {
  RemoveFromCartUseCase({@required this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, Furniture>> call(Params params) async {
    return await repository.removeFromCart(params.id);
  }
}