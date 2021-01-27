import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/cart.dart';
import '../../../furniture/data/models/furniture_model.dart';

part 'cart_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartModel extends Cart {
  CartModel({
    List<FurnitureModel> furnitures,
    Map<int, int> furnitureMap,
  }) : super(furnitures: furnitures, furnitureMap: furnitureMap);

  static CartModel fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
