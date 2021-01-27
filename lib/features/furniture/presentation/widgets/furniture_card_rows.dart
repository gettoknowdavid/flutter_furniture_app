import 'package:flutter/material.dart';

class PaddedRow extends StatelessWidget {
  const PaddedRow({Key key, this.child, this.leftPadding}) : super(key: key);

  final Widget child;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            // SizedBox(height: spacerHeight),
            Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: child,
            ),
          ],
        );
      },
    );
  }
}

class NormalRow extends StatelessWidget {
  const NormalRow({Key key, this.child, this.width = 120.0}) : super(key: key);

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const ClampingScrollPhysics(),
      // reverse: true,
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(width: width),
        child,
      ],
    );
  }
}
