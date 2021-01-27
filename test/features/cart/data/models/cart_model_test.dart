import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/utils/lamda_cart.dart';
import 'package:flutter_furniture_app/features/cart/data/models/cart_model.dart';
import 'package:flutter_furniture_app/features/cart/domain/entity/cart.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final expected = {
    'furnitures': [],
    'furnitureMap': {'1': 1},
  };
  test('should be a sub class of the Cart entity', () async {
    expect(tCartModel, isA<Cart>());
  });

  test('should return Cart class from the JSON map', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('cart.json'));

    final result = CartModel.fromJson(jsonMap);

    expect(result, tCartModel);
  });

  test('should return JSON map from the Cart class', () async {
    final result = tCartModel.toJson();

    expect(result, expected);
  });
}
