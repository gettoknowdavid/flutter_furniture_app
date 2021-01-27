import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/furniture.dart';
import '../../domain/entity/furniture_type.dart';
import 'package:meta/meta.dart';

part 'furniture_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FurnitureModel extends Furniture {
  FurnitureModel({
    @required int id,
    @required String name,
    @required String designer,
    @required String description,
    @required String imageUrl,
    @required double price,
    @required double rating,
    @required FurnitureType type,
    @required List<int> colorValues,
  }) : super(
          id: id,
          name: name,
          designer: designer,
          description: description,
          imageUrl: imageUrl,
          price: price,
          rating: rating,
          type: type,
          colorValues: colorValues,
        );

  FurnitureModel copyWith({int id}) {
    return FurnitureModel(
      id: id ?? this.id,
      name: name,
      designer: designer,
      description: description,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      type: type,
      colorValues: colorValues,
    );
  }

  static FurnitureModel fromJson(Map<String, dynamic> json) =>
      _$FurnitureModelFromJson(json);
  Map<String, dynamic> toJson() => _$FurnitureModelToJson(this);
}
