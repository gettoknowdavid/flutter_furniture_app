// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FurnitureModel _$FurnitureModelFromJson(Map<String, dynamic> json) {
  return FurnitureModel(
    id: json['id'] as int,
    name: json['name'] as String,
    designer: json['designer'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    price: (json['price'] as num)?.toDouble(),
    rating: (json['rating'] as num)?.toDouble(),
    type: _$enumDecodeNullable(_$FurnitureTypeEnumMap, json['type']),
    colorValues: (json['colorValues'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$FurnitureModelToJson(FurnitureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'designer': instance.designer,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'type': _$FurnitureTypeEnumMap[instance.type],
      'colorValues': instance.colorValues,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$FurnitureTypeEnumMap = {
  FurnitureType.chair: 'chair',
  FurnitureType.lamp: 'lamp',
  FurnitureType.table: 'table',
};
