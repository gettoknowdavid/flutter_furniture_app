import 'package:equatable/equatable.dart';
import '../../../furniture/data/models/furniture_model.dart';

class Cart extends Equatable {
  Cart({
    this.furnitures,
    this.furnitureMap,
  });

  final List<FurnitureModel> furnitures;
  final Map<int, int> furnitureMap;

  @override
  List<Object> get props => [furnitures, furnitureMap];
}
