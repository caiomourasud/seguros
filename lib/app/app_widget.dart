import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/controllers/app_controller.dart';
import 'package:seguros/themes/custom_themes.dart';
import 'package:seguros/utils/connectivity_status.dart';

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

    // return Observer(builder: (_) {
    return MaterialApp(
      title: 'Seguros',
      debugShowCheckedModeBanner: false,
      theme: CustomThemes().light,
      darkTheme: CustomThemes().dark,
      themeMode: ThemeMode.light,
      // themeMode: _appController.autoTheme
      //     ? ThemeMode.system
      //     : _appController.isDarkTheme
      //         ? ThemeMode.dark
      //         : ThemeMode.light,
      initialRoute: '/',
    ).modular();
    // });
  }
}
