part of 'furniture_bloc.dart';

abstract class FurnitureState extends Equatable {
  const FurnitureState();

  @override
  List<Object> get props => [];
}

class FurnitureEmpty extends FurnitureState {}

class FurnitureLoading extends FurnitureState {}

class FurnitureLoaded extends FurnitureState {
  FurnitureLoaded({this.furnitures});

  final List<Furniture> furnitures;

  @override
  List<Object> get props => [furnitures];
}

class FurnitureError extends FurnitureState {
  FurnitureError({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
