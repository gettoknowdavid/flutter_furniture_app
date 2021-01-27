import 'package:flutter/material.dart';
import '../../domain/entity/furniture.dart';
import 'furniture_card.dart';

class AssymetricView extends StatelessWidget {
  const AssymetricView({Key key, @required this.furnitures}) : super(key: key);

  final List<Furniture> furnitures;

  List<Widget> _buildRows(BuildContext context) {
    if (furnitures == null || furnitures.isEmpty) {
      return const <Container>[];
    }

    return List<Widget>.generate(furnitures.length, (int index) {
      final width = MediaQuery.of(context).size.width;

      final spacing = width * .06;

      // final top = (width * 0.35) * 0.5;
      final bottom = (width * 0.35) * 0.25;

      if (index % 2 == 0) {
        return Container();
      } else {
        return Wrap(
          alignment: WrapAlignment.center,
          spacing: spacing,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: FurnitureCard(furniture: furnitures[index]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: FurnitureCard(furniture: furnitures[index - 1]),
            ),
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 50.0),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: _buildRows(context),
    );
  }
}
