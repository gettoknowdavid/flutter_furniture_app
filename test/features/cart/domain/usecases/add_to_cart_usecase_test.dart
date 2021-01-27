import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/usecase/params.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture.dart';
import 'package:flutter_furniture_app/features/cart/domain/repository/cart_repository.dart';
import 'package:flutter_furniture_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements CartRepository {}

void main() {
  MockRepository mockRepository;
  AddToCartUseCase useCase;

  setUp(() {
    mockRepository = MockRepository();
    useCase = AddToCartUseCase(repository: mockRepository);
  });

  final tId = 1;

  test('should add furniture to cart when called from repository', () async {
    when(mockRepository.addToCart(tId)).thenAnswer(
      (_) async =>  Right(tFurniture),
    );

    final result = await useCase(Params(id: tId));

    expect(result, Right(tFurniture));

    verify(mockRepository.addToCart(tId));

    verifyNoMoreInteractions(mockRepository);
  });
}
