import 'package:dartz/dartz.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/usecase/no_params.dart';
import 'package:flutter_furniture_app/features/furniture/domain/repository/furniture_repository.dart';
import 'package:flutter_furniture_app/features/furniture/domain/usecase/get_all_furniture_usecase.dart';
import 'package:mockito/mockito.dart';

class MockFurnitureRepository extends Mock implements FurnitureRepository {}

void main() {
  GetAllFunitureUseCase useCase;
  MockFurnitureRepository mockRepository;

  setUp(() {
    mockRepository = MockFurnitureRepository();
    useCase = GetAllFunitureUseCase(repository: mockRepository);
  });

  test('should get all furniture from the repository', () async {
    when(mockRepository.getAllFurniture()).thenAnswer((_)async => Right(allFurniture));

    final result = await useCase(NoParams());

    expect(result, Right(allFurniture));

    verify(mockRepository.getAllFurniture());

    verifyNoMoreInteractions(mockRepository);
  });
}

