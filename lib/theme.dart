import 'package:flutter/material.dart';

const Color primary = const Color(0xFF393452);
const Color primaryVariant = const Color(0xFF242137);
const Color secondary = const Color(0xFFFDD302);
const Color secondaryVariant = const Color(0xFFBF1D1A);

const Color appPurple = const Color(0xFF231F33);
const Color appGrey = const Color(0xFFEDEDEF);
const Color appWhite = const Color(0xFFF4F4F6);

class LamdaTheme {
  static get theme {
    final base = ThemeData.light();

    ColorScheme colorScheme = ColorScheme.light(
      primary: primary,
      primaryVariant: primaryVariant,
      onPrimary: secondary,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      surface: appGrey,
      onSurface: appPurple,
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        textTheme: _textTheme(base.textTheme),
      ),
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      shadowColor: primary.withOpacity(0.3),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      iconTheme: _iconTheme(base.iconTheme),
      accentIconTheme: _iconTheme(base.accentIconTheme),
      primaryIconTheme: _iconTheme(base.primaryIconTheme),
      textTheme: _textTheme(base.textTheme),
      accentTextTheme: _textTheme(base.accentTextTheme),
      primaryTextTheme: _textTheme(base.primaryTextTheme),
    );
  }
}

TextTheme _textTheme(TextTheme base) {
  return base
      .copyWith(
          headline6: base.headline6.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ))
      .apply(
        fontFamily: 'ProductSans',
        bodyColor: primary,
        displayColor: primary,
      );
}

IconThemeData _iconTheme(IconThemeData base) {
  return base.copyWith(color: appPurple, size: 30);
}
