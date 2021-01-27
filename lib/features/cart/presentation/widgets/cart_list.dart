import 'package:flutter/material.dart';
import '../../../furniture/domain/entity/furniture.dart';

import 'cart_item.dart';

class CartList extends StatelessWidget {
  CartList({@required this.furnitures, @required this.furnitureMap});

  final List<Furniture> furnitures;
  final Map<int, int> furnitureMap;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children(
        List<Furniture> furnitures, Map<int, int> furnitureMap) {
      return furnitureMap.keys.map((int id) {
        Furniture _furniture = furnitures.firstWhere((f) => f.id == id);

        return CartItem(furniture: _furniture, furnitureMap: furnitureMap);
      }).toList();
    }

    return SingleChildScrollView(
      child: Column(
        children: _children(furnitures, furnitureMap),
      ),
    );
  }
}
