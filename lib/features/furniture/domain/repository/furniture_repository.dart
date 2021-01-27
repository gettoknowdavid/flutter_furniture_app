import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/furniture.dart';

abstract class FurnitureRepository {
  Future<Either<Failure, List<Furniture>>> getAllFurniture();
}
