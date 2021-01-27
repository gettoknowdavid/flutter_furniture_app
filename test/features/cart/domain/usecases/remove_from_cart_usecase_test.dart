import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/usecase/params.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture.dart';
import 'package:flutter_furniture_app/features/cart/domain/repository/cart_repository.dart';
import 'package:flutter_furniture_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements CartRepository {}

void main() {
  MockRepository mockRepository;
  RemoveFromCartUseCase useCase;

  setUp(() {
    mockRepository = MockRepository();
    useCase = RemoveFromCartUseCase(repository: mockRepository);
  });

  final tId = 1;
  test(
    'should remove a furniture from cart when called from the repository',
    () async {
      when(mockRepository.removeFromCart(any)).thenAnswer(
        (_) async => Right(tFurniture),
      );

      final result = await useCase(Params(id: tId));

      expect(result, Right(tFurniture));

      verify(mockRepository.removeFromCart(tId));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
