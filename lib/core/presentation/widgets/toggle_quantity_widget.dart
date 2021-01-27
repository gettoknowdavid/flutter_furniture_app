import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ToggleQuantityWidget extends StatelessWidget {
  const ToggleQuantityWidget({
    Key key,
    @required this.add,
    @required this.remove,
    @required this.value,
  }) : super(key: key);

  final VoidCallback add;
  final VoidCallback remove;
  final int value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final width = MediaQuery.of(context).size.width;

    final mainWidth = width * 0.3;

    return Container(
      width: mainWidth,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle),
              splashRadius: 20,
              onPressed: remove,
              color: colorScheme.primary,
              iconSize: 23,
            ),
            Expanded(
              child: AutoSizeText(
                value.toString() ?? '0',
                minFontSize: 18,
                style: textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle),
              splashRadius: 20,
              onPressed: add,
              color: colorScheme.primary,
              iconSize: 23,
            ),
          ],
        ),
      ),
    );
  }
}
