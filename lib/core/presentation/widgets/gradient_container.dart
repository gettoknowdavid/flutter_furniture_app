import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.child,
    this.spreadRadius,
    this.blurRadius,
    this.shadowColor,
    this.offset,
    this.borderRadius,
    this.alignment,
    this.onPressed,
  }) : super(key: key);

  final double height;
  final double width;
  final double spreadRadius;
  final double blurRadius;
  final double borderRadius;
  final Color shadowColor;
  final Offset offset;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final AlignmentGeometry alignment;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? colorScheme.primary.withOpacity(0.3),
            spreadRadius: spreadRadius ?? 3,
            blurRadius: blurRadius ?? 22,
            offset: offset ?? Offset(0, 10),
          )
        ],
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primaryVariant,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: RawMaterialButton(
        constraints: BoxConstraints(minWidth: width, minHeight: height),
        splashColor: colorScheme.primaryVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
