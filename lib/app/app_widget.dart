import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/app_controller.dart';
import 'themes/custom_themes.dart';
import 'utils/connectivity_status.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _appController = Modular.get<AppController>();

late StreamSubscription<ConnectivityResult> connectivitySubscription;

final Connectivity _connectivity = Connectivity();

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    _appController.setContext(context);
    ConnectivityStatus().initConnectivity(mounted);
    connectivitySubscription = _connectivity.onConnectivityChanged
        .listen(ConnectivityStatus().updateConnectionStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light));
    }

    return MaterialApp(
      title: 'Seguros',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('pt', ''),
      ],
      theme: CustomThemes().light,
      darkTheme: CustomThemes().dark,
      themeMode: ThemeMode.light,
      initialRoute: '/',
    ).modular();
  }
}
