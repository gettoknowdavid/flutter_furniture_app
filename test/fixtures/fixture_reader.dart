import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

final expectedMap = {
  'id': 1,
  'name': 'Bedside Table',
  'designer': 'Angelo C. Marköv',
  'description':
      'The design pattern of Angelo Markov speaks volumes in simplicity, symmetry and contrast.',
  'imageUrl': 'images/bedside-table.png',
  'price': 97.0,
  'rating': 4.3,
  'type': 'table',
  'colorValues': [623151],
};
