import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/usecase/no_params.dart';
import 'package:flutter_furniture_app/core/utils/lamda_cart.dart';
import 'package:flutter_furniture_app/features/cart/domain/repository/cart_repository.dart';
import 'package:flutter_furniture_app/features/cart/domain/usecases/get_furnitures_in_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements CartRepository {}

void main() {
  MockRepository mockRepository;
  GetFurnituresInCartUseCase useCase;

  setUp(() {
    mockRepository = MockRepository();
    useCase = GetFurnituresInCartUseCase(repository: mockRepository);
  });

  test(
    'should get all furniture in cart when called from repository',
    () async {
      when(mockRepository.getFurnituresInCart()).thenAnswer(
        (_) async => Right(tCart),
      );

      final result = useCase(NoParams());

      expect(result, Right(tCart));

      verify(mockRepository.getFurnituresInCart());

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
