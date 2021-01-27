import 'package:flutter/material.dart';
import '../../domain/entity/furniture.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    Key key,
    @required this.furniture,
    this.selectedIndex,
    this.onSelected,
  }) : super(key: key);

  final Furniture furniture;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;

    final rowHeight = height * 0.06;
    final colorCircleHeight = rowHeight * 0.47;

    return Container(
      height: rowHeight,
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: furniture.colorValues.map((value) {
          final _index = furniture.colorValues.indexOf(value);
          final _isSelected = selectedIndex == _index;

          return GestureDetector(
            onTap: () => onSelected(_index),
            child: Container(
              height: colorCircleHeight,
              width: colorCircleHeight,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(value),
                border: Border.all(
                  color:
                      _isSelected ? colorScheme.secondary : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
