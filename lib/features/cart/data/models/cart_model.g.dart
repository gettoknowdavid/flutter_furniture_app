// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    furnitures: (json['furnitures'] as List)
        ?.map((e) => e == null
            ? null
            : FurnitureModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    furnitureMap: (json['furnitureMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as int),
    ),
  );
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'furnitures': instance.furnitures?.map((e) => e?.toJson())?.toList(),
      'furnitureMap':
          instance.furnitureMap?.map((k, e) => MapEntry(k.toString(), e)),
    };
