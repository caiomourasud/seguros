import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

final Connectivity _connectivity = Connectivity();

class ConnectivityStatus {
  Future<void> initConnectivity(bool mounted) async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }
    updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        print(result.toString());
        // _appController.setConnectionStatus(result.toString());

        break;
      default:
        print(result.toString());
        // _appController.setConnectionStatus(result.toString());
        break;
    }
  }
}
