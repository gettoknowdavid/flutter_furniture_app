import '../../features/furniture/domain/entity/furniture.dart';
import '../../features/furniture/domain/entity/furniture_type.dart';

final allFurniture = <Furniture>[
  Furniture(
    id: 1,
    name: 'Bedside Table',
    designer: 'Angelo C. Marköv',
    description:
        'The design pattern of Angelo Markov speaks volumes in simplicity, symmetry and contrast.',
    imageUrl: 'images/bedside-table.png',
    price: 97.0,
    rating: 4.3,
    type: FurnitureType.table,
    colorValues: [0xFF62351F, 0xFF000000, 0xFF62351F],
  ),
  Furniture(
    id: 2,
    name: 'Brown Furnished Center Table',
    designer: 'Hans J. Wagner',
    description:
        'American designer, Hans J. Wagner, brings to life, the modern texture of beauty with this center piece, fully furnished.',
    imageUrl: 'images/brown-furnished-center-table.png',
    price: 120.0,
    rating: 3.3,
    type: FurnitureType.table,
    colorValues: [0xFF62351F],
  ),
  Furniture(
    id: 3,
    name: 'Colossal Grey Arm Chair',
    designer: 'Monica Förster',
    description:
        'The Swedish designer, Monica Förster\'s style is characterized by her eternal love for new materials and beautiful shapes.',
    imageUrl: 'images/grey-chair.png',
    price: 245.0,
    rating: 4.8,
    type: FurnitureType.chair,
    colorValues: [0xFFAAA59F],
  ),
  Furniture(
    id: 4,
    name: 'Beautiful White Coffee Table',
    designer: 'Boca Do Lobo',
    description:
        'Everything from start to finish speaks volumes of this designer\'s simplicity and courage to try new ways of passing the egde.',
    imageUrl: 'images/white-coffee-table.png',
    price: 178.0,
    rating: 2.8,
    type: FurnitureType.table,
    colorValues: [0xFFFFFFFF],
  ),
  Furniture(
    id: 5,
    name: 'Brown Loft Dining Table',
    designer: 'Angelo C. Marköv',
    description:
        'The design pattern of Angelo Markov speaks volumes in simplicity, symmetry and contrast.',
    imageUrl: 'images/loft-dining-table.png',
    price: 376.0,
    rating: 4.2,
    type: FurnitureType.table,
    colorValues: [0xFFAA7B61],
  ),
  Furniture(
    id: 6,
    name: 'Nest Chair',
    designer: 'Monica Förster',
    description:
        'The Swedish designer, Monica Förster\'s style is characterized by her eternal love for new materials and beautiful shapes.',
    imageUrl: 'images/red-chair.png',
    price: 300.0,
    rating: 4.2,
    type: FurnitureType.chair,
    colorValues: [0xFFB30027],
  ),
  Furniture(
    id: 7,
    name: 'Tiffany Lamp Shade',
    designer: 'Patrick De Santo',
    description:
        'This retro look for the lamp shade amplifies Patrick\'s love for the 20th century and all the excellent poise it brings back.',
    imageUrl: 'images/tiffany-lamp-shade.png',
    price: 297.0,
    rating: 3.0,
    type: FurnitureType.lamp,
    colorValues: [0xFF413D3F],
  ),
  Furniture(
    id: 8,
    name: 'The Ostrich Lamp',
    designer: 'Emilia M. Garner',
    description:
        'Emelia takes us into the wild with this Ostrich legged lamp that brings stands out easily even without a lamp.',
    imageUrl: 'images/tripod-lamp.png',
    price: 149.0,
    rating: 4.0,
    type: FurnitureType.lamp,
    colorValues: [0xFF413D3F],
  ),
  Furniture(
    id: 9,
    name: 'White Cool Lounge Chair',
    designer: 'Emilia M. Garner',
    description:
        'Beyound being normal, Emelia Garner delivers this eccentric view to use with this lovely white lounge chair for comfort and excellence.',
    imageUrl: 'images/white-cool-lounge-chair.png',
    price: 320.0,
    rating: 5.0,
    type: FurnitureType.chair,
    colorValues: [0xFFFFFFFF],
  ),
  Furniture(
    id: 10,
    name: 'Aavansah Arm Chair',
    designer: 'Gordon Cornelius',
    description:
        'This aavansah arm chair is an exquisite masterpiece, suitable for minimalist spaces that require beauty and excellence without leaving comfort behind.',
    imageUrl: 'images/white-arm-chair.png',
    price: 430.0,
    rating: 5.0,
    type: FurnitureType.chair,
    colorValues: [0xFFBDB3A8],
  ),
];
