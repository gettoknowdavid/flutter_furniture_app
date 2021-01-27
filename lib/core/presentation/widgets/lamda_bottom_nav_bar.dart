import 'package:flutter/material.dart';

import 'gradient_container.dart';

class LamdaBottomNavBarItem {
  final Widget icon;
  final Color activeColor;
  final Color inActiveColor;

  const LamdaBottomNavBarItem({
    this.icon,
    this.activeColor,
    this.inActiveColor,
  });
}

class LamdaBottomNavBar extends StatelessWidget {
  final int index;
  final List<LamdaBottomNavBarItem> items;
  final ValueChanged<int> onSelected;

  const LamdaBottomNavBar({
    Key key,
    @required this.index,
    @required this.items,
    @required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: size.height * 0.067,
      width: size.width,
      color: Colors.transparent,
      child: Material(
        elevation: 12,
        color: Colors.white,
        child: Row(
          children: items.map((item) {
            int _index = items.indexOf(item);
            bool isSelected = _index == index;
            Color _color =
                isSelected ? colorScheme.secondary : Color(0xFFC5C5C5);
            double _iconSize = 32.0;

            return GestureDetector(
              onTap: () => onSelected(_index),
              child: Semantics(
                container: true,
                selected: isSelected,
                child: Container(
                  alignment: Alignment.center,
                  width: (size.width) / items.length,
                  child: isSelected
                      ? GradientContainer(
                          alignment: Alignment.center,
                          height: height * 0.045,
                          width: height * 0.045,
                          borderRadius: 60,
                          child: IconTheme(
                            data: IconThemeData(color: _color, size: _iconSize),
                            child: item.icon,
                          ),
                        )
                      : IconTheme(
                          data: IconThemeData(color: _color, size: _iconSize),
                          child: item.icon,
                        ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
