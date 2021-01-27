
import 'package:equatable/equatable.dart';

import 'furniture_type.dart';

class Furniture extends Equatable {
  final int id;
  final String name;
  final String designer;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final FurnitureType type;
  final List<int> colorValues;

  Furniture({
    this.id,
    this.name,
    this.designer,
    this.description,
    this.imageUrl,
    this.price,
    this.rating,
    this.type,
    this.colorValues,
  });

  @override
  List<Object> get props => [
        id,
        name,
        designer,
        description,
        imageUrl,
        price,
        rating,
        type,
        colorValues,
      ];
}
