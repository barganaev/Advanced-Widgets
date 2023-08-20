import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDark = ThemeData.dark();

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: const AppBarTheme(
    color: Colors.purple,
  ),
  textTheme: _textLight(_themeLight.textTheme),
);

ThemeData themeDark = _themeDark.copyWith(
  appBarTheme: const AppBarTheme(
    color: Colors.yellow
  ),
  textTheme: _textDark(_themeDark.textTheme),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyText1: base.bodyText1?.copyWith(
      color: Colors.cyan,
    ),
    bodyText2: base.bodyText2?.copyWith(
      color: Colors.cyan,
    ),
  );
}

TextTheme _textDark(TextTheme base) {
  return base.copyWith(
    bodyText1: base.bodyText1?.copyWith(
      color: Colors.deepOrange,
    ),
    bodyText2: base.bodyText1?.copyWith(
      color: Colors.deepOrange,
    )
  );
}