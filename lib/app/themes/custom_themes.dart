import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.purple.shade800,
    onPrimary: Colors.white,
    secondary: Colors.purple.shade800,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.grey,
    surface: Colors.white,
    onSurface: Colors.grey.shade900,
  );

  get light => ThemeData(
      colorScheme: colorScheme,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: CupertinoColors.white,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: CupertinoColors.white),
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: Colors.purple[800]));

  get dark => ThemeData(
      colorScheme: colorScheme,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: CupertinoColors.black,
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: Colors.purple[800]));
}
