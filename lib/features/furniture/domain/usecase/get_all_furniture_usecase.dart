import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/furniture.dart';
import '../repository/furniture_repository.dart';
import 'package:meta/meta.dart';

class GetAllFunitureUseCase implements UseCase<List<Furniture>, NoParams> {
  GetAllFunitureUseCase({@required this.repository});

  final FurnitureRepository repository;

  @override
  Future<Either<Failure, List<Furniture>>> call(NoParams params) async {
    return await repository.getAllFurniture();
  }
}
