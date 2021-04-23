import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  get light => ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.purple[800],
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: Colors.purple[800]));

  get dark => ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.purple[800],
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: CupertinoColors.black,
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: Colors.purple[800]));
}
