import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture.dart';
import 'package:flutter_furniture_app/features/furniture/data/models/furniture_model.dart';
import 'package:flutter_furniture_app/features/furniture/domain/entity/furniture.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a sub class of the Furniture entity', () async {
    expect(tFurnitureModel, isA<Furniture>());
  });

  test('should return Furniture class from the JSON map', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('furniture.json'));

    final result = FurnitureModel.fromJson(jsonMap);

    expect(result, tFurnitureModel);
  });
  test('should return JSON map from the Furniture class', () async {
    final result = tFurnitureModel.toJson();

    expect(result, expectedMap);
  });
}
