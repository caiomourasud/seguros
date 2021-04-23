import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguros/app/themes/custom_themes.dart';

class DefaultView extends StatelessWidget {
  final Widget page;
  final GlobalKey<NavigatorState>? navigatorKey;
  const DefaultView({required this.page, this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemes().light,
      darkTheme: CustomThemes().dark,
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return ClipRect(child: page);
          },
        );
      },
    );
  }
}
