import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/params.dart';
import '../../domain/entity/cart.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/get_furnitures_in_cart_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import '../../../furniture/domain/entity/furniture.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    @required this.getFurnituresInCartUseCase,
    @required this.addToCartUseCase,
    @required this.removeFromCartUseCase,
  }) : super(CartEmpty());

  final GetFurnituresInCartUseCase getFurnituresInCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetFurnituresInCartEvent) {
      final _failureOrCart = await getFurnituresInCartUseCase(NoParams());

      yield CartLoading();

      yield* _eitherFailureOrCarts(_failureOrCart);
    } else if (event is AddToCartEvent) {
      await addToCartUseCase(Params(id: event.id));

      final _failureOrCart = await getFurnituresInCartUseCase(NoParams());

      yield CartLoading();

      yield* _eitherFailureOrCarts(_failureOrCart);
    } else if (event is RemoveFromCartEvent) {
      await removeFromCartUseCase(Params(id: event.id));

      final _failureOrCart = await getFurnituresInCartUseCase(NoParams());

      yield CartLoading();

      yield* _eitherFailureOrCarts(_failureOrCart);
    }
  }

  Stream<CartState> _eitherFailureOrCarts(
      Either<Failure, Cart> failureOrCart) async* {
    yield failureOrCart.fold(
      (failure) => CartError(message: _mapFailureToMessage(failure)),
      (cart) => CartLoaded(
        furnitures: cart.furnitures,
        furnitureMap: cart.furnitureMap,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case DatabaseFailure:
        return 'Database Error: Failed to load last air quality from store.';
      default:
        return 'Unexpected Error';
    }
  }
}
