import 'package:flutter/material.dart';

class LamdaBackButton extends StatelessWidget {
  const LamdaBackButton({Key key, this.size, this.color}) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: ImageIcon(
        AssetImage('images/icons/back-arrow.png'),
        size: size ?? theme.iconTheme.size,
        color: color ?? theme.colorScheme.primary,
      ),
    );
  }
}