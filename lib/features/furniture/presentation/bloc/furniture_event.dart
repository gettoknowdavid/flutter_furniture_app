part of 'furniture_bloc.dart';

abstract class FurnitureEvent extends Equatable {
  const FurnitureEvent();

  @override
  List<Object> get props => [];
}

class GetAllFurnitureEvent extends FurnitureEvent {}
