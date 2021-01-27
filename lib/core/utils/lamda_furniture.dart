import '../../features/furniture/data/models/furniture_model.dart';
import '../../features/furniture/domain/entity/furniture.dart';
import '../../features/furniture/domain/entity/furniture_type.dart';

final tFurniture = Furniture(
  id: 1,
  name: 'Bedside Table',
  designer: 'Angelo C. Marköv',
  description:
      'The design pattern of Angelo Markov speaks volumes in simplicity, symmetry and contrast.',
  imageUrl: 'images/bedside-table.png',
  price: 97.0,
  rating: 4.3,
  type: FurnitureType.table,
  colorValues: [0xFF62351F],
);

final tFurnitureModel = FurnitureModel(
  id: 1,
  name: 'Bedside Table',
  designer: 'Angelo C. Marköv',
  description:
      'The design pattern of Angelo Markov speaks volumes in simplicity, symmetry and contrast.',
  imageUrl: 'images/bedside-table.png',
  price: 97.0,
  rating: 4.3,
  type: FurnitureType.table,
  colorValues: [623151],
);
