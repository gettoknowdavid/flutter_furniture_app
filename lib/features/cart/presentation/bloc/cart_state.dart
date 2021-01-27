part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmpty extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartLoaded({@required this.furnitures, @required this.furnitureMap});

  final List<Furniture> furnitures;
  final Map<int, int> furnitureMap;

  @override
  List<Object> get props => [furnitures, furnitureMap];
}

class CartError extends CartState {
  CartError({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
