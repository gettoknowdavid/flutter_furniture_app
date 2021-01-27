import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture_model_list.dart';
import 'package:flutter_furniture_app/features/furniture/data/datasources/furniture_local_data_source.dart';
import 'package:flutter_furniture_app/features/furniture/data/repository/furniture_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements FurnitureLocalDataSource {}

void main() {
  MockLocalDataSource mockLocalDataSource;
  FurnitureRepositoryImplementation repository;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = FurnitureRepositoryImplementation(
      localDataSource: mockLocalDataSource,
    );
  });

  test(
    'should return locally stored data when the data is in the store',
    () async {
       when(mockLocalDataSource.getAllFurniture()).thenAnswer(
          (_) async => allFurnitureModels,
        );

        final result = await repository.getAllFurniture();

        verify(mockLocalDataSource.getAllFurniture());

        expect(result, equals(Right(allFurnitureModels)));
    },
  );
}
