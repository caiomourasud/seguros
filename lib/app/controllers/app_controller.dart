import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  BuildContext? buildContext;

  @action
  setContext(value) => buildContext = value;

  @observable
  String connectionStatus = 'Unknown';

  @action
  setConnectionStatus(String value) {
    print(value);
    return connectionStatus = value;
  }

  @computed
  bool get noInternet =>
      connectionStatus == 'ConnectivityResult.none' ||
      connectionStatus == 'Unknown';
}
