part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetFurnituresInCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  AddToCartEvent({@required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}

class RemoveFromCartEvent extends CartEvent {
  RemoveFromCartEvent({@required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}
