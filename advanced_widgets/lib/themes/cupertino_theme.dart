import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final CupertinoThemeData _cupertinoBase = CupertinoThemeData();

final CupertinoThemeData cupertinoLightTheme = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: Colors.cyan,
  textTheme: _cupertinoBase.textTheme.copyWith(
    textStyle: TextStyle(
      color: CupertinoColors.placeholderText,
      fontSize: 20,
    ),
  ),
);
final CupertinoThemeData cupertinoDarkTheme = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: Colors.brown,
  barBackgroundColor: CupertinoColors.activeGreen,
);

