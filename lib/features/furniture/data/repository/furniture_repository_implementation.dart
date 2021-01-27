import '../../../../core/utils/lamda_furniture_model_list.dart';

import '../../../../core/errors/exceptions.dart';
import '../datasources/furniture_local_data_source.dart';
import '../../domain/entity/furniture.dart';
import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/furniture_repository.dart';
import 'package:meta/meta.dart';

class FurnitureRepositoryImplementation implements FurnitureRepository {
  FurnitureRepositoryImplementation({@required this.localDataSource});

  FurnitureLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Furniture>>> getAllFurniture() async {
    try {
      await localDataSource.storeAllFurniture(allFurnitureModels);

      final result = await localDataSource.getAllFurniture();

      return Right(result);
    } on DbException {
      return Left(DatabaseFailure());
    }
  }
}
