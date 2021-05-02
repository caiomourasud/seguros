// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool>? _$noInternetComputed;

  @override
  bool get noInternet =>
      (_$noInternetComputed ??= Computed<bool>(() => super.noInternet,
              name: '_AppControllerBase.noInternet'))
          .value;

  final _$contextAtom = Atom(name: '_AppControllerBase.context');

  @override
  BuildContext? get context {
    _$contextAtom.reportRead();
    return super.context;
  }

  @override
  set context(BuildContext? value) {
    _$contextAtom.reportWrite(value, super.context, () {
      super.context = value;
    });
  }

  final _$connectionStatusAtom =
      Atom(name: '_AppControllerBase.connectionStatus');

  @override
  String get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(String value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setContext(dynamic value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConnectionStatus(String value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setConnectionStatus');
    try {
      return super.setConnectionStatus(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
context: ${context},
connectionStatus: ${connectionStatus},
noInternet: ${noInternet}
    ''';
  }
}
